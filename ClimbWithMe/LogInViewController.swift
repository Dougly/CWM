//
//  LogInViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 4/30/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseDatabase

class LogInViewController: UIViewController, GIDSignInUIDelegate {
    
    let dataStore = DataStore.sharedInstance
    let logInView = LogInView()
    let googleSignInButton = GIDSignInButton()
    var keyboardIsShowing = false
    let ref = FIRDatabase.database().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        addObseversForKeyboard()
        setUpGoogleSignIn()
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    
    func checkIfUserIsAlreadySignedIn() {
        // Sign in user automatically
        // THIS IS BROKEN -- SOMETHING ABOUT PRESENTING VC on VC whos view is not in window heirarchy
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if let user = user {
                let navVC = NavigationInterfaceViewController()
                self.dataStore.user = User(uid: user.uid, userEmail: (user.email ?? ""), name: (user.displayName ?? ""))
                self.present(navVC, animated: true, completion: nil)
            }
        }
    }
    
    func presentRegisterUserVC() {
        // Display VC to register new user with email and password
        self.present(RegisterUserViewController(), animated: true, completion: nil)
    }
    
    
}


// MARK: Firebase Google and User Email/Pass Sign in Methods
extension LogInViewController: GIDSignInDelegate {
    
    // Sign in with Email and Password
    func signIn() {
        if let email = logInView.usernameTextField.text,
            let password = logInView.passwordTextField.text {
            
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if let error = error {
                    print("🔥 failed to sign in user with email and password \(error)")
                } else if let user = user {
                    let loggedInUser = User(uid: user.uid, userEmail: email, name: "place holder")
                    let navVC = NavigationInterfaceViewController()
                    self.dataStore.user = loggedInUser
                    self.present(navVC, animated: true, completion: nil)
                }
            })
        }
    }
    
    
    
    
    // Sign in with Gooogle
    func setUpGoogleSignIn() {
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: [:])
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            print("🔥 Error when signing in with google \(error)")
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            if let error = error {
                print("🔥 Error after getting credential with google \(error)")
                return
            } else if let user = user {
                guard let email = user.email else { return }
                let loggedInUser = User(uid: user.uid, userEmail: email, name: (user.displayName ?? ""))
                self.ref.child("users").child(user.uid).observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
                    let value = snapshot.value as? [String : Any]
                    if value != nil {
                        print("🔥 user already exists")
                    } else {
                        // create user in database
                        self.ref.child("users").child(user.uid).setValue(["email": email, "name" : user.displayName])
                        
                    }
                })
                
                
                let navVC = NavigationInterfaceViewController()
                self.dataStore.user = loggedInUser
                self.present(navVC, animated: true, completion: nil)
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
}

// MARK: Animate views around keyboard showing and hiding
extension LogInViewController {
    
    func showHideKeyboard(_ sender: Notification) {
        
        if let userInfo = sender.userInfo {
            let keyboardRect = userInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
            let keyboardHeight = keyboardRect.height
            
            if sender.name == NSNotification.Name.UIKeyboardWillShow && !keyboardIsShowing {
                keyboardIsShowing = true
                logInView.animateKeyboard(with: keyboardHeight, hidingKeyboard: false)
                
            } else if sender.name == NSNotification.Name.UIKeyboardWillHide && keyboardIsShowing {
                logInView.animateKeyboard(with: keyboardHeight, hidingKeyboard: true)
                keyboardIsShowing = false
            }
        }
    }
    
    
    
    
}


// MARK: View Setup
extension LogInViewController {
    
    func addObseversForKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(showHideKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showHideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func setUpViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(logInView)
        view.setEqualConstraints(for: logInView, navBarHeight: self.navigationController?.navigationBar.frame.size.height ?? 0)
        
        // Register New Account Button
        logInView.registerButton.addTarget(self, action: #selector(presentRegisterUserVC), for: .touchUpInside)
        
        // Sign In with email and password
        logInView.logInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }
    
}

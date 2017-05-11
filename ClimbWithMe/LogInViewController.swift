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
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self

        
        // uncomment to Sign in silently
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if let user = user {
                let mainVC = MainViewController()
                mainVC.user = User(uid: user.uid, userEmail: (user.email ?? ""), name: (user.displayName ?? ""))
                self.present(mainVC, animated: true, completion: nil)
            }
        }


        
    }
    
    func presentRegisterUserVC() {
        self.present(RegisterUserViewController(), animated: true, completion: nil)
        
    }
    
   
    
    func signIn() {
        if let email = logInView.usernameTextField.text,
            let password = logInView.passwordTextField.text {
            
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if let error = error {
                    print("🔥 failed to sign in user with email and password \(error)")
                } else if let user = user {
                    let loggedInUser = User(uid: user.uid, userEmail: email, name: "place holder")
                    print("🔥 singed in user with email and password \(user)")
                    let mainVC = MainViewController()
                    mainVC.user = loggedInUser
                    self.present(mainVC, animated: true, completion: {
                        print("transitioned to mainVC after logging in with email and password")
                    })
                }
            })
        }
    }

}

extension LogInViewController: GIDSignInDelegate {
    
    // Firebase GIDSignInDelegate Methods
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: [:])
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            print("🔥 Error when signing in with google \(error)")
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            // ...
            if let error = error {
                print("🔥 Error after getting credential with google \(error)")
                return
            } else if let user = user {
                guard let email = user.email else { return }
                
                let loggedInUser = User(uid: user.uid, userEmail: email, name: (user.displayName ?? ""))
                print("🔥 succesfully authenticared with google \(user)")
                
                
                self.ref.child("users").child(user.uid).observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
                    let value = snapshot.value as? [String : Any]
                    if value != nil {
                        print("🔥 user already exists")
                    } else {
                        print("🔥 create user in database")
                        self.ref.child("users").child(user.uid).setValue(["email": user.email, "name" : user.displayName])
                    }
                })
                
                
                
                
                let mainVC = MainViewController()
                self.present(mainVC, animated: true, completion: {
                    print("transitioned to mainVC after logging in with google")
                    mainVC.user = loggedInUser
                    
                })

            }
        }
    
    }
    
    
    
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
}

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
        let screenHeight = UIScreen.main.bounds.height
        
        self.view.backgroundColor = .white
        self.view.addSubview(logInView)
        view.setEqualConstraints(for: logInView)
        
        
        // Google Sign In Button
        self.view.addSubview(googleSignInButton)
        
        googleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        googleSignInButton.centerXAnchor.constraint(equalTo: self.logInView.centerXAnchor).isActive = true
        googleSignInButton.centerYAnchor.constraint(equalTo: self.logInView.centerYAnchor, constant: screenHeight * 0.2).isActive = true
        googleSignInButton.widthAnchor.constraint(equalTo: logInView.logInStackView.widthAnchor).isActive = true
        googleSignInButton.heightAnchor.constraint(equalTo: googleSignInButton.widthAnchor, multiplier: 0.5).isActive = true
        
        // Register New Account Button
        logInView.registerButton.addTarget(self, action: #selector(presentRegisterUserVC), for: .touchUpInside)
        
        // Sign In with email and password
        logInView.logInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }
    
}

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
    
    let logInView = LogInView()
    let googleSignInButton = GIDSignInButton()
    var keyboardIsShowing = false
    let ref = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        GIDSignIn.sharedInstance().uiDelegate = self

        
        NotificationCenter.default.addObserver(self, selector: #selector(showHideKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showHideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        
    }
    
    func registerUser() {
        if let email = logInView.usernameTextField.text,
            let password = logInView.passwordTextField.text {
            
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                if let error = error {
                    print("🔥 failed to create user with email and password \(error)")
                } else if let user = user {
                    self.ref.child("users").child(user.uid).setValue(["username": email])
                    print("🔥 created user with email and password \(user)")
                }
            })
        }
    }
    
    func signIn() {
        if let email = logInView.usernameTextField.text,
            let password = logInView.passwordTextField.text {
            
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if let error = error {
                    print("🔥 failed to sign in user with email and password \(error)")
                } else if let user = user {
                    print("🔥 singed in user with email and password \(user)")
                    self.present(MainViewController(), animated: true, completion: { 
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
                print("🔥 succesfully authenticared with google \(user)")
                self.ref.child("users").child(user.uid).setValue(["username": user.email])
                self.present(MainViewController(), animated: true, completion: {
                    print("transitioned to mainVC after logging in with google")
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

extension LogInViewController {
    
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
        logInView.registerButton.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
        
        // Sign In with email and password
        logInView.logInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }
    
}

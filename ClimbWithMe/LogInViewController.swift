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

class LogInViewController: UIViewController, GIDSignInUIDelegate {
    
    let logInView = LogInView()
    let googleSignInButton = GIDSignInButton()
    var keyboardIsShowing = false
    
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
                    print("🔥 created user with email and password \(user)")
                }
            })
        }
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
        
    }
    
}

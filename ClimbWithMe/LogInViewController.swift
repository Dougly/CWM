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

class LogInViewController: UIViewController {
    
    let logInView = LogInView()
    var keyboardIsShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpGoogleSignIn()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showHideKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showHideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        
    }

    
    
}


// Firebase Google Authentication
extension LogInViewController: GIDSignInUIDelegate {
    
    func setUpGoogleSignIn() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
        // TODO(developer) Configure the sign-in button look/feel
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
        self.view.backgroundColor = .white
        self.view.addSubview(logInView)
        view.setEqualConstraints(for: logInView)
    }
    
}

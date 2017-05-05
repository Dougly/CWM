//
//  LogInViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 4/30/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    let logInView = LogInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showHideKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showHideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        
    }

    
    
}

extension LogInViewController {
    
    func showHideKeyboard(_ sender: Notification) {
//        if sender.name == NSNotification.Name.UIKeyboardWillShow {
//            if let userInfo = sender.userInfo {
//                let keyboardRect = userInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
//                let keyboardHeight = keyboardRect.height
//                logInView.animateForKeyboard(with: keyboardHeight, hidingKeyboard: false)
//                
//            }
//        } else {
//            logInView.animateForKeyboard(with: 0, hidingKeyboard: true)
//        }
    }
    
    
    
    
}

extension LogInViewController {
    
    func setUpViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(logInView)
        view.setEqualConstraints(for: logInView)
    }
    
}

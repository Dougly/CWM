//
//  RegisterUserViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/10/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseDatabase

class RegisterUserViewController: UIViewController {
    
    let registerUserView = RegisterUserView()
    let ref = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func registerUser() {
        
        let name = "\(registerUserView.firstNameTextField.text ?? "") \(registerUserView.lastNameTextField.text ?? "")"
        
        
        if let email = registerUserView.emailTextField.text,
            let password = registerUserView.passwordTextField.text {
            
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                if let error = error {
                    print("🔥 failed to create user with email and password \(error)")
                } else if let user = user {
                    self.ref.child("users").child(user.uid).setValue(["email" : email,
                                                                      "name" : name])
                    print("🔥 created user with email and password \(user)")
                    self.dismiss(animated: true, completion: nil)
                }
            })
        }
    }
    
    func showHideKeyboard(_ sender: Notification) {
        
    }

    
    func setUpView() {
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height

        
        registerUserView.createButton.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
        
        self.view.backgroundColor = .white
        self.view.addSubview(registerUserView)
        
        registerUserView.translatesAutoresizingMaskIntoConstraints = false
        
        registerUserView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: statusBarHeight).isActive = true
        registerUserView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        registerUserView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75).isActive = true
        registerUserView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    
    
}


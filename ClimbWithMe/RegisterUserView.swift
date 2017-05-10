//
//  RegisterUserView.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/10/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class RegisterUserView: UIView {
    
    let profilePictureImageView = UIImageView()
    let firstNameTextField = UITextField()
    let lastNameTextField = UITextField()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let confirmPasswordTextField = UITextField()
    let stackView = UIStackView()
    let createButton = UIButton(type: .system)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
    }
    
    func setUpViews() {
        
        self.backgroundColor = .blue
        
        firstNameTextField.borderStyle = .roundedRect
        firstNameTextField.backgroundColor = .white
        firstNameTextField.keyboardType = UIKeyboardType.alphabet
        firstNameTextField.returnKeyType = UIReturnKeyType.next
        firstNameTextField.tag = 1
        firstNameTextField.delegate = self
        
        lastNameTextField.borderStyle = .roundedRect
        lastNameTextField.backgroundColor = .white
        lastNameTextField.keyboardType = UIKeyboardType.alphabet
        lastNameTextField.returnKeyType = UIReturnKeyType.next
        lastNameTextField.tag = 2
        lastNameTextField.delegate = self
        
        emailTextField.borderStyle = .roundedRect
        emailTextField.backgroundColor = .white
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        emailTextField.returnKeyType = UIReturnKeyType.next
        emailTextField.tag = 3
        emailTextField.delegate = self
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.backgroundColor = .white
        passwordTextField.keyboardType = UIKeyboardType.alphabet
        passwordTextField.returnKeyType = UIReturnKeyType.next
        passwordTextField.tag = 4
        passwordTextField.delegate = self
        
        confirmPasswordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.backgroundColor = .white
        confirmPasswordTextField.keyboardType = UIKeyboardType.alphabet
        confirmPasswordTextField.returnKeyType = UIReturnKeyType.done
        confirmPasswordTextField.tag = 5
        confirmPasswordTextField.delegate = self

        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        
        createButton.setTitle("Create", for: .normal)
        createButton.titleLabel?.font = UIFont(name: "Helvetica", size: 12)
        
        profilePictureImageView.image = #imageLiteral(resourceName: "ic_person_48pt")
        
        stackView.addArrangedSubview(firstNameTextField)
        stackView.addArrangedSubview(lastNameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(confirmPasswordTextField)
        
        self.addSubview(profilePictureImageView)
        self.addSubview(stackView)
        self.addSubview(createButton)
        
        profilePictureImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        profilePictureImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        profilePictureImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        profilePictureImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        profilePictureImageView.heightAnchor.constraint(equalTo: profilePictureImageView.widthAnchor).isActive = true
        
        createButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        createButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        createButton.heightAnchor.constraint(equalTo: createButton.widthAnchor, multiplier: 0.1).isActive = true
        createButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: profilePictureImageView.bottomAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: createButton.topAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
}

extension RegisterUserView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            
            switch textField.tag {
            case 1: self.lastNameTextField.becomeFirstResponder()
            case 2: self.emailTextField.becomeFirstResponder()
            case 3: self.passwordTextField.becomeFirstResponder()
            case 4: self.confirmPasswordTextField.becomeFirstResponder()
            case 5: self.confirmPasswordTextField.resignFirstResponder()
            default: break
            }
            
        } else if textField.returnKeyType == .done {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layoutIfNeeded()
    }
    
}

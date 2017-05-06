//
//  LogInView.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 4/30/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LogInView: UIView {
    
    let logoWithTextImageView = UIImageView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let logInButton = UIButton(type: .system)
    let registerButton = UIButton(type: .system)
    let buttonsStackView = UIStackView()
    let logInStackView = UIStackView()
    let googleSignInButton = GIDSignInButton()
    var logInStackViewCenterY = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubViews()
    }
    
    
}


// TextField Delegate
extension LogInView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            self.passwordTextField.becomeFirstResponder()
        } else if textField.returnKeyType == .done {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layoutIfNeeded()
    }
    
}


// Animations
extension LogInView {
    
    func animateKeyboard(with constant: CGFloat, hidingKeyboard: Bool) {
        
        if !hidingKeyboard {
            UIView.animate(withDuration: 0.5, animations: {
                self.logInStackViewCenterY.constant -= constant
                self.logoWithTextImageView.alpha = 0.25
                self.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.logInStackViewCenterY.constant += constant
                self.logoWithTextImageView.alpha = 1
                self.layoutIfNeeded()
            })
            
        }
    }
    
    
}


// View Setup
extension LogInView {
    
    func setUpSubViews() {
        let screenHeight = UIScreen.main.bounds.height
        let buttonFont = UIFont(name: "Arial", size: 12)

        
        // View properties
        logoWithTextImageView.image = #imageLiteral(resourceName: "logo_with_text")
        
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.backgroundColor = .white
        usernameTextField.keyboardType = UIKeyboardType.emailAddress
        usernameTextField.returnKeyType = UIReturnKeyType.next
        usernameTextField.delegate = self
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.backgroundColor = .white
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.delegate = self
        
        logInButton.setTitle("Log In", for: .normal)
        logInButton.titleLabel?.font = buttonFont
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.titleLabel?.font = buttonFont
        
        buttonsStackView.addArrangedSubview(registerButton)
        buttonsStackView.addArrangedSubview(logInButton)
        buttonsStackView.alignment = UIStackViewAlignment.fill
        buttonsStackView.axis = UILayoutConstraintAxis.horizontal
        buttonsStackView.distribution = UIStackViewDistribution.equalSpacing
        
        logInStackView.addArrangedSubview(usernameTextField)
        logInStackView.addArrangedSubview(passwordTextField)
        logInStackView.addArrangedSubview(buttonsStackView)
        logInStackView.alignment = .fill
        logInStackView.axis = .vertical
        logInStackView.distribution = .equalSpacing
        
        
        // Add subviews to self
        self.addSubview(logoWithTextImageView)
        self.addSubview(logInStackView)
        
        
        // Constraints
        logoWithTextImageView.translatesAutoresizingMaskIntoConstraints = false
        logInStackView.translatesAutoresizingMaskIntoConstraints = false
        googleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        
        logoWithTextImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 1).isActive = true
        logoWithTextImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: screenHeight * -0.25).isActive = true
        logoWithTextImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        logoWithTextImageView.heightAnchor.constraint(equalTo: logoWithTextImageView.widthAnchor, multiplier: 146/104).isActive = true
        
        logInStackViewCenterY = logInStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: screenHeight * 0.1)
        logInStackViewCenterY.isActive = true
        logInStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        logInStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75).isActive = true
        logInStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        
        
        
    }
    
}




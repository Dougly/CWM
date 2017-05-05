//
//  LogInView.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 4/30/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class LogInView: UIView {
    
    let logoWithTextImageView = UIImageView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let logInButton = UIButton(type: .system)
    let forgotButton = UIButton(type: .system)
    let buttonsStackView = UIStackView()
    let logInStackView = UIStackView()
    var logInStackViewCenterY = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubViews()
    }

    
    func logInButtonTapped() {
        print("log in button tapped")
    }
    
    func forgotButtonTapped() {
        print("forgot button tapped")
    }
    
    
}


// TextField Delegate
extension LogInView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layoutIfNeeded()
    }
    
}


// Animations
extension LogInView {
    
    func animateForKeyboard(with constant: CGFloat, hidingKeyboard: Bool) {
        
        if hidingKeyboard {
            UIView.animate(withDuration: 0.5, animations: {
                self.logInStackViewCenterY.constant -= constant
                self.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.logInStackViewCenterY.constant = 0
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

        
        //View properties
        logoWithTextImageView.image = #imageLiteral(resourceName: "logo_with_text")
        
        usernameTextField.borderStyle = .line
        usernameTextField.keyboardType = UIKeyboardType.emailAddress
        usernameTextField.returnKeyType = UIReturnKeyType.done
        usernameTextField.delegate = self
        
        passwordTextField.borderStyle = .line
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.delegate = self
        
        logInButton.setTitle("Log In", for: .normal)
        logInButton.titleLabel?.font = buttonFont
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        
        forgotButton.setTitle("Forgot", for: .normal)
        forgotButton.titleLabel?.font = buttonFont
        forgotButton.addTarget(self, action: #selector(forgotButtonTapped), for: .touchUpInside)
        
        buttonsStackView.addArrangedSubview(forgotButton)
        buttonsStackView.addArrangedSubview(logInButton)
        buttonsStackView.alignment = UIStackViewAlignment.fill
        buttonsStackView.axis = UILayoutConstraintAxis.horizontal
        buttonsStackView.distribution = UIStackViewDistribution.fillEqually
        
        logInStackView.addArrangedSubview(usernameTextField)
        logInStackView.addArrangedSubview(passwordTextField)
        logInStackView.addArrangedSubview(buttonsStackView)
        logInStackView.alignment = .fill
        logInStackView.axis = .vertical
        logInStackView.distribution = .equalSpacing
        logInStackView.backgroundColor = .black
        
        
        //Add to view
        self.addSubview(logoWithTextImageView)
        self.addSubview(logInStackView)
        
        
        //Constraints
        logoWithTextImageView.translatesAutoresizingMaskIntoConstraints = false
        logInStackView.translatesAutoresizingMaskIntoConstraints = false
        
        logoWithTextImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 1).isActive = true
        logoWithTextImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: screenHeight * -0.25).isActive = true
        logoWithTextImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        logoWithTextImageView.heightAnchor.constraint(equalTo: logoWithTextImageView.widthAnchor, multiplier: 146/104).isActive = true
        
        logInStackViewCenterY = logInStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        logInStackViewCenterY.isActive = true
        logInStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        logInStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75).isActive = true
        logInStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
    }
    
}




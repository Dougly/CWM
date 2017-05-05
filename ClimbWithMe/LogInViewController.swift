//
//  LogInViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 4/30/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    let logInView = LogInView(frame: CGRect())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewWillShow()

    }
    
    
}

extension LogInViewController {
    
    func viewWillShow() {
        logInView.animateForKeyboard(with: 20, hidingKeyboard: false)
    }
    
    
}

extension LogInViewController {
    
    func setUpViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(logInView)
        view.setEqualConstraints(for: logInView)
    }
    
}

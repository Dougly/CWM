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
        view.backgroundColor = .red
        self.view.addSubview(logInView)
        view.setEqualConstraints(for: logInView)
    }
    
    
    
}

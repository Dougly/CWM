//
//  LogInView.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 4/30/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class LogInView: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var logoWithTextImageView: UIImageView!
    @IBOutlet weak var logInStackViewCenterY: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("LogInView", owner: self, options: nil)
        self.addSubview(view)
        self.setEqualConstraints(for: view)
    }
    
    func animateForKeyboard(with constant: CGFloat, hidingKeyboard: Bool) {
        
        if hidingKeyboard {
            UIView.animate(withDuration: 0.5, animations: {
                self.logInStackViewCenterY.constant -= constant
                self.logoWithTextImageView.alpha = 0.25
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.logInStackViewCenterY.constant = 0
                self.logoWithTextImageView.alpha = 1
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    
}



//
//  NavigationHeaderView.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 6/2/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class NavigationHeaderView: UIView {
    
    let spacing = (UIScreen.main.bounds.width / 2) - (UIScreen.main.bounds.height * 0.5)
    let leftImageView = UIImageView()
    let centerImageView = UIImageView()
    let rightImageView = UIImageView()
    var centerXConstraint = NSLayoutConstraint()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func tappedImageView(_ sender: UITapGestureRecognizer) {
        if let senderView = sender.view {
            switch senderView.tag {
            case 1: animateBySettingConstant(to: -spacing)
            case 2: animateBySettingConstant(to: 0)
            case 3: animateBySettingConstant(to: spacing)
            default: break
            }
        }
    }
    
    
    func animateBySettingConstant(to constant: CGFloat) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
            self.centerXConstraint.constant = constant
            self.layoutIfNeeded()
        }) { (success) in
            if success {
                // TO DO
            }
        }
    }

    
    func commonInit() {
        
        
        self.backgroundColor = .white
        
        leftImageView.image = #imageLiteral(resourceName: "ic_person_48pt")
        centerImageView.image = #imageLiteral(resourceName: "logo_blue")
        rightImageView.image = #imageLiteral(resourceName: "ic_chat_48pt")
        
        leftImageView.isUserInteractionEnabled = true
        centerImageView.isUserInteractionEnabled = true
        rightImageView.isUserInteractionEnabled = true
        
        leftImageView.tag = 1
        centerImageView.tag = 2
        rightImageView.tag = 3
        
        self.addSubview(leftImageView)
        self.addSubview(centerImageView)
        self.addSubview(rightImageView)
        
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        centerImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        
        centerXConstraint = centerImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        centerXConstraint.isActive = true
        centerImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        centerImageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        centerImageView.widthAnchor.constraint(equalTo: centerImageView.heightAnchor).isActive = true
        
        leftImageView.centerXAnchor.constraint(equalTo: centerImageView.centerXAnchor, constant: spacing).isActive = true
        leftImageView.centerYAnchor.constraint(equalTo: centerImageView.centerYAnchor).isActive = true
        leftImageView.widthAnchor.constraint(equalTo: centerImageView.widthAnchor).isActive = true
        leftImageView.heightAnchor.constraint(equalTo: centerImageView.heightAnchor).isActive = true
        
        rightImageView.centerXAnchor.constraint(equalTo: centerImageView.centerXAnchor, constant: -spacing).isActive = true
        rightImageView.centerYAnchor.constraint(equalTo: centerImageView.centerYAnchor).isActive = true
        rightImageView.widthAnchor.constraint(equalTo: centerImageView.widthAnchor).isActive = true
        rightImageView.heightAnchor.constraint(equalTo: centerImageView.heightAnchor).isActive = true
        
        let leftTapGR = UITapGestureRecognizer(target: self, action: #selector(tappedImageView))
        let centerTapGR = UITapGestureRecognizer(target: self, action: #selector(tappedImageView))
        let rightTapGR = UITapGestureRecognizer(target: self, action: #selector(tappedImageView))
        
        leftImageView.addGestureRecognizer(leftTapGR)
        centerImageView.addGestureRecognizer(centerTapGR)
        rightImageView.addGestureRecognizer(rightTapGR)
        
    }
    
    
    
}

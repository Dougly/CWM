//
//  AppHeaderView.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/6/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class AppHeaderView: UIView {
    
    let logoImageView = UIImageView()
    let profileImageView = UIImageView()
    let chatImageView = UIImageView()
    let selectionBar = UIView()
    var selectionBarCenterX = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubViews()
    }
    
    func animateSelectionBar(constant: CGFloat) {
        UIView.animate(withDuration: 0.5) { 
            self.selectionBarCenterX.constant = constant
            self.layoutIfNeeded()
        }
    }
    
    func animateSelectionBar(byAdding constant: CGFloat) {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut], animations: { 
            self.selectionBarCenterX.constant += constant
            self.layoutIfNeeded() 
        }, completion: nil)
    
    }

}

extension AppHeaderView {
    
    func setUpSubViews() {
        
        let width = UIScreen.main.bounds.width
        self.backgroundColor = .white
        
        logoImageView.image = #imageLiteral(resourceName: "logo_blue")
        logoImageView.isUserInteractionEnabled = true
        profileImageView.image = #imageLiteral(resourceName: "ic_person_48pt")
        profileImageView.isUserInteractionEnabled = true
        chatImageView.image = #imageLiteral(resourceName: "ic_chat_48pt")
        chatImageView.isUserInteractionEnabled = true
        selectionBar.backgroundColor = .black
        
        self.addSubview(logoImageView)
        self.addSubview(profileImageView)
        self.addSubview(chatImageView)
        self.addSubview(selectionBar)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        chatImageView.translatesAutoresizingMaskIntoConstraints = false
        selectionBar.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor).isActive = true
        
        profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: width * 0.025).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.75).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.75).isActive = true
        
        chatImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: width * -0.025).isActive = true
        chatImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        chatImageView.widthAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.75).isActive = true
        chatImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.75).isActive = true
        
        selectionBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        selectionBar.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/10).isActive = true
        selectionBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        selectionBarCenterX = selectionBar.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        selectionBarCenterX.isActive = true
        
    }
    
}

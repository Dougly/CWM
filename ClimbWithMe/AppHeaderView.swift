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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubViews()
    }

}

extension AppHeaderView {
    
    func setUpSubViews() {
        
        let width = UIScreen.main.bounds.width
        
        logoImageView.image = #imageLiteral(resourceName: "logo_blue")
        profileImageView.image = #imageLiteral(resourceName: "ic_person_48pt")
        chatImageView.image = #imageLiteral(resourceName: "ic_chat_48pt")
        
        self.addSubview(logoImageView)
        self.addSubview(profileImageView)
        self.addSubview(chatImageView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        chatImageView.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        
        
    }
    
}

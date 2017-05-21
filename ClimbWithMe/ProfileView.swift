//
//  ProfileViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/11/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    let pictureAndNameView = PictureAndNameView()
    let logoutButton = UIButton(type: .system)
    let viewType = ViewType.profileView
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubViews()
    }
    
}


extension ProfileView {
    
    func setUpSubViews() {
        self.backgroundColor = .white

        

        
        logoutButton.setTitle("Log Out", for: .normal)
        logoutButton.backgroundColor = .blue
    
        self.addSubview(pictureAndNameView)
        self.addSubview(tableView)
        self.addSubview(logoutButton)
       
        pictureAndNameView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        pictureAndNameView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pictureAndNameView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pictureAndNameView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        pictureAndNameView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/9).isActive = true
        
        tableView.topAnchor.constraint(equalTo: pictureAndNameView.bottomAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: pictureAndNameView.centerXAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3).isActive = true
        tableView.widthAnchor.constraint(equalTo: pictureAndNameView.widthAnchor).isActive = true
        
        logoutButton.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/9).isActive = true
        logoutButton.widthAnchor.constraint(equalTo: tableView.widthAnchor).isActive = true
        
        
    }
}



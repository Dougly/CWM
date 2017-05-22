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
    
    
    func setUpSubViews() {
        self.backgroundColor = .white
    
        self.addSubview(pictureAndNameView)
        self.addSubview(tableView)
       
        pictureAndNameView.translatesAutoresizingMaskIntoConstraints = false
        pictureAndNameView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        pictureAndNameView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pictureAndNameView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pictureAndNameView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        pictureAndNameView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/9).isActive = true
        
        tableView.topAnchor.constraint(equalTo: pictureAndNameView.bottomAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: pictureAndNameView.centerXAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: pictureAndNameView.widthAnchor).isActive = true
        
    }
}



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
    let stackView = UIStackView()
    let gymsLabel = UILabel()
    let climbingCertifications = UILabel()
    let climbingLevel = UILabel()
    let logoutButton = UIButton(type: .system)
    let viewType = ViewType.profileView
    
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

        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        logoutButton.setTitle("Log Out", for: .normal)
        logoutButton.backgroundColor = .blue
        
        // TODO: change to user selected data
        gymsLabel.text = "GYMS"
        climbingCertifications.text = "CLIMBING CERTIFICATIONS"
        climbingLevel.text = "CLIMBINGLEVEL"
        
        
        stackView.addArrangedSubview(gymsLabel)
        stackView.addArrangedSubview(climbingCertifications)
        stackView.addArrangedSubview(climbingLevel)
        
        self.addSubview(pictureAndNameView)
        self.addSubview(stackView)
        self.addSubview(logoutButton)
        
        pictureAndNameView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        pictureAndNameView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pictureAndNameView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pictureAndNameView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        pictureAndNameView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/9).isActive = true
        
        stackView.topAnchor.constraint(equalTo: pictureAndNameView.bottomAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: pictureAndNameView.centerXAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3).isActive = true
        stackView.widthAnchor.constraint(equalTo: pictureAndNameView.widthAnchor).isActive = true
        
        logoutButton.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/9).isActive = true
        logoutButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        
    }
}



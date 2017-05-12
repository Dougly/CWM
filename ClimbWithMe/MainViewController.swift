//
//  HomeViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/6/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let headerView = AppHeaderView()
    let findPartnerView = FindPartnerView()
    let profileView = ProfileView()
    let chatView = ChatView()
    var findPartnerLeadingConstraint = NSLayoutConstraint()
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
        
        
    }
    func animateToNewView(_ sender: UITapGestureRecognizer) {
        if let senderView = sender.view {
            switch senderView.tag {
            case 1:
                animate(constraint: findPartnerLeadingConstraint, with: UIScreen.main.bounds.width)
                headerView.animateSelectionBar(constant: (UIScreen.main.bounds.width / 3) * -1)
            case 2:
                animate(constraint: findPartnerLeadingConstraint, with: 0)
                headerView.animateSelectionBar(constant: 0)
            case 3:
                animate(constraint: findPartnerLeadingConstraint, with: UIScreen.main.bounds.width * -1)
                headerView.animateSelectionBar(constant: UIScreen.main.bounds.width / 3)
            default: break
            }
        }
    }
    
    //MOV ANIMATION TO VIEW
    func animate(constraint: NSLayoutConstraint, with constant: CGFloat) {
        UIView.animate(withDuration: 0.5) {
            constraint.constant = constant
            self.view.layoutIfNeeded()
        }
    }
}

extension MainViewController {
    
    
    
    func setUpViews() {
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let profileImageViewTapGR = UITapGestureRecognizer(target: self, action: #selector(animateToNewView))
        headerView.profileImageView.tag = 1
        headerView.profileImageView.addGestureRecognizer(profileImageViewTapGR)
        
        let findClimberViewTapGR = UITapGestureRecognizer(target: self, action: #selector(animateToNewView))
        headerView.logoImageView.tag = 2
        headerView.logoImageView.addGestureRecognizer(findClimberViewTapGR)
        
        let chatViewTapGR = UITapGestureRecognizer(target: self, action: #selector(animateToNewView))
        headerView.chatImageView.tag = 3
        headerView.chatImageView.addGestureRecognizer(chatViewTapGR)
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(headerView)
        self.view.addSubview(findPartnerView)
        self.view.addSubview(profileView)

        headerView.translatesAutoresizingMaskIntoConstraints = false
        findPartnerView.translatesAutoresizingMaskIntoConstraints = false
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: statusBarHeight).isActive = true
        headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        findPartnerView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        findPartnerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        findPartnerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        // constraint for animation
        findPartnerLeadingConstraint = findPartnerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        findPartnerLeadingConstraint.isActive = true
        
        profileView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        profileView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        profileView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        profileView.trailingAnchor.constraint(equalTo: findPartnerView.leadingAnchor).isActive = true
        
        


    }
    
}

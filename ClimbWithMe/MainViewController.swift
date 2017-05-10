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
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
}

extension MainViewController {
    
    func setUpViews() {
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(headerView)
        self.view.addSubview(findPartnerView)

        headerView.translatesAutoresizingMaskIntoConstraints = false
        findPartnerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: statusBarHeight).isActive = true
        headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        findPartnerView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        findPartnerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        findPartnerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        findPartnerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true

    }
    
}

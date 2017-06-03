//
//  ProfileViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/22/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewContoller: UIViewController {
    
    let profileView = ProfileView()
    let firebaseAuth = FIRAuth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    // Functionality for Logoout Button
    func logoutButtonTapped(_ sender: UIButton) {
        do {
            try firebaseAuth?.signOut()
            self.dismiss(animated: true, completion: {
                print("user signed out")
            })
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    func presentFindPartnerVC() {
        //self.navigationController?.pop(transitionType: kCATransitionPush, subtype: kCATransitionFromRight, duration: 0.3)
    }
    
    func setupView() {
        
        let profileTableViewDelegate = ProfileTableViewDelegate()
        profileView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "gymCell")
        profileView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "headerCell")
        profileView.tableView.delegate = profileTableViewDelegate
        profileView.tableView.dataSource = profileTableViewDelegate
        
        self.view.addSubview(profileView)
        self.view.setEqualConstraints(for: profileView, navBarHeight: 0)
        
        
        
    }
}

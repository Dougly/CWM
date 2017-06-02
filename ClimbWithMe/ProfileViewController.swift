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
    
    func setupNavigationBar() {
        let image : UIImage = UIImage(named: "ic_person_48pt")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        rightButton.setImage(#imageLiteral(resourceName: "logo_blue"), for: .normal)
        rightButton.addTarget(self, action: #selector(presentFindPartnerVC), for: .touchUpInside)
        rightButton.clipsToBounds = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
        let leftButton = UIButton()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
    }
    
    func setupView() {
        
        setupNavigationBar()
        self.navigationItem.title = "Profile"
        
        let profileTableViewDelegate = ProfileTableViewDelegate()
        profileView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "gymCell")
        profileView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "headerCell")
        profileView.tableView.delegate = profileTableViewDelegate
        profileView.tableView.dataSource = profileTableViewDelegate
        
        self.view.addSubview(profileView)
        self.view.setEqualConstraints(for: profileView, navBarHeight: self.navigationController?.navigationBar.frame.size.height ?? 0)
        
        
        
    }
}

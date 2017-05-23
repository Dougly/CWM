//
//  HomeViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/6/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let dataStore = DataStore.sharedInstance
    let findPartnerView = FindPartnerView()


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
        
    }
    
    func presentProfileView() {
        let profileVC = ProfileViewContoller()
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func presentChatView() {
        
    }
    
    func setupNavigationBar() {
        let image : UIImage = UIImage(named: "logo_blue")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_person_48pt"), style: .plain, target: self, action: #selector(presentProfileView))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_chat_48pt"), style: .plain, target: self, action: #selector(presentChatView))
        
    }
    
    func setUpViews() {
        
        setupNavigationBar()
        
        if let user = dataStore.user {
            findPartnerView.pictureAndNameView.pictureImageView.image = user.profileImage ?? #imageLiteral(resourceName: "ic_person_48pt")
            findPartnerView.pictureAndNameView.nameLabel.text = user.name
            findPartnerView.gymLabel.text = "Gym: \(user.gyms.first ?? "No Gyms")"
            findPartnerView.typeLabel.text = "Type: \(user.certifications.first?.rawValue ?? "No Certificiation")"
            findPartnerView.timeLabel.text = "--:--"
        }
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(findPartnerView)
        self.view.setEqualConstraints(for: findPartnerView, navBarHeight: self.navigationController?.navigationBar.frame.size.height ?? 0)

        
    }
    
}

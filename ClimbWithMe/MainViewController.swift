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

    
    func setUpViews() {
        
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "logo_blue"))
        
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
//        findPartnerView.translatesAutoresizingMaskIntoConstraints = false
//
//        findPartnerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        findPartnerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        findPartnerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
//        findPartnerView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
    }
    
}

//
//  HomeViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/6/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit


class FindPartnerViewController: UIViewController {
    
    let dataStore = DataStore.sharedInstance
    let findPartnerView = FindPartnerView()


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()

    }
    
    
    
    func setUpViews() {
                
        if let user = dataStore.user {
            findPartnerView.pictureAndNameView.pictureImageView.image = user.profileImage ?? #imageLiteral(resourceName: "ic_person_48pt")
            findPartnerView.pictureAndNameView.nameLabel.text = user.name
            findPartnerView.gymLabel.text = "Gym: \(user.gyms.first ?? "No Gyms")"
            findPartnerView.typeLabel.text = "Type: \(user.certifications.first?.rawValue ?? "No Certificiation")"
            findPartnerView.timeLabel.text = "--:--"
        }
            
        self.view.addSubview(findPartnerView)
        self.view.setEqualConstraints(for: findPartnerView, navBarHeight: 0)
        
    }
    
}

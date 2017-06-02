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
    
    func presentProfileView() {
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        transition.type = kCATransitionFromRight
//        
//        self.navigationController?.view.layer.add(transition, forKey: nil)
        //let profileVC = ProfileViewContoller()
//        self.navigationController?.pushViewController(profileVC, animated: false)
        //self.navigationController?.push(viewController: profileVC, transitionType: kCATransitionPush, subtype: kCATransitionFromLeft, duration: 0.3)
        
    }
    
    func presentChatView() {
        let chatVC = ChatViewController()
        self.navigationController?.pushViewController(chatVC, animated: true)
    }
    
    func setupNavigationBar() {
        let image : UIImage = UIImage(named: "logo_blue")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        
        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        leftButton.setImage(#imageLiteral(resourceName: "ic_person_48pt"), for: .normal)
        leftButton.addTarget(self, action: #selector(presentProfileView), for: .touchUpInside)
        leftButton.clipsToBounds = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        rightButton.setImage(#imageLiteral(resourceName: "ic_chat_48pt"), for: .normal)
        rightButton.addTarget(self, action: #selector(presentChatView), for: .touchUpInside)
        rightButton.clipsToBounds = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
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
        self.view.setEqualConstraints(for: findPartnerView, navBarHeight: 0)
        
    }
    
}

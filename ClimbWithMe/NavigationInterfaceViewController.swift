//
//  NavigationInterfaceViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 6/2/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class NavigationInterfaceViewController: UIViewController {
    
    let navSegmentControl = UISegmentedControl()
    let containerView = UIView()
    
    lazy var profileVC: ProfileViewContoller = {
        let vc = ProfileViewContoller()
        self.addAsChildVC(childVC: vc)
        return vc
    }()
    
    lazy var findPartnerVC: FindPartnerViewController = {
        let vc = FindPartnerViewController()
        self.addAsChildVC(childVC: vc)
        return vc
    }()
    
    lazy var chatVC: ChatViewController = {
        let vc = ChatViewController()
        self.addAsChildVC(childVC: vc)
        return vc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        findPartnerVC.view.isHidden = false
    }
    
    func addAsChildVC(childVC: UIViewController) {
        addChildViewController(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.frame
        childVC.didMove(toParentViewController: self)
    }
    
    private func removeAsChildVC(childVC: UIViewController) {
        childVC.willMove(toParentViewController: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParentViewController()
    }
    
    func madeSelection(_ sender: UISegmentedControl) {
//        blueVC.view.isHidden = sender.selectedSegmentIndex == 1
//        redVC.view.isHidden = sender.selectedSegmentIndex == 0
    }
    
    func setupViews() {
        
        let screenHeight = UIScreen.main.bounds.height
        
        navSegmentControl.addTarget(self, action: #selector(madeSelection), for: .valueChanged)
        
        navSegmentControl.insertSegment(withTitle: "blue", at: 0, animated: false)
        navSegmentControl.insertSegment(withTitle: "red", at: 1, animated: false)
        navSegmentControl.selectedSegmentIndex = 0
        
        view.addSubview(containerView)
        view.addSubview(navSegmentControl)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        navSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        navSegmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navSegmentControl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: screenHeight / -2.5).isActive = true
        
    }

    
}

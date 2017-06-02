//
//  NavigationInterfaceViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 6/2/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class NavigationInterfaceViewController: UIViewController {
    
    let navigationHeaderView = NavigationHeaderView()
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
    
    private func addAsChildVC(childVC: UIViewController) {
        addChildViewController(childVC)
        containerView.addSubview(childVC.view)
        containerView.setEqualConstraints(for: childVC.view, navBarHeight: 0)
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
    
    private func setupViews() {
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        self.view.backgroundColor = .gray
        
        view.addSubview(containerView)
        view.addSubview(navigationHeaderView)
        
        navigationHeaderView.translatesAutoresizingMaskIntoConstraints = false
        navigationHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: statusBarHeight).isActive = true
        navigationHeaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navigationHeaderView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navigationHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: navigationHeaderView.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }

}

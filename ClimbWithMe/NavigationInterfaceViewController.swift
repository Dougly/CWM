//
//  NavigationInterfaceViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 6/2/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

enum Direction {
    case left, right
}

class NavigationInterfaceViewController: UIViewController {
    
    let navigationHeaderView = NavigationHeaderView()
    var visibleVC = UIViewController()
    let containerView = UIView()
    
    let profileVC: ProfileViewContoller = ProfileViewContoller()
    let findPartnerVC: FindPartnerViewController  = FindPartnerViewController()
    let chatVC: ChatViewController = ChatViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAsChildVC(childVC: profileVC)
        profileVC.view.isHidden = true
        addAsChildVC(childVC: findPartnerVC)
        addAsChildVC(childVC: chatVC)
        chatVC.view.isHidden = true
        setupViews()
        visibleVC = findPartnerVC
    }
    
    
    private func addAsChildVC(childVC: UIViewController) {
        addChildViewController(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.frame
        childVC.didMove(toParentViewController: self)
    }
    
    
    func tappedImageView(_ sender: UITapGestureRecognizer) {
        let spacing = (navigationHeaderView.frame.width / 2) - (navigationHeaderView.frame.height / 2)
        if let senderView = sender.view {
            switch senderView.tag {
            case 1:
                navigationHeaderView.animateBySettingConstant(to: spacing)
                move(fromVC: visibleVC, toVC: profileVC, direction: .right)
            case 2:
                navigationHeaderView.animateBySettingConstant(to: 0)
                let direction: Direction = visibleVC.view.tag == 1 ? .left : .right
                move(fromVC: visibleVC, toVC: findPartnerVC, direction: direction)
            case 3:
                navigationHeaderView.animateBySettingConstant(to: -spacing)
                move(fromVC: visibleVC, toVC: chatVC, direction: .left)
            default: break
            }
        }
    }
    
    
    func move(fromVC: UIViewController, toVC: UIViewController, direction: Direction) {
        var startXPosition = visibleVC.view.frame.width
        let width = visibleVC.view.frame.width
        let height = visibleVC.view.frame.height
        
        if direction == .right { startXPosition *= -1 }
        
        let toVCStartPosition = CGRect(x: startXPosition, y: 0, width: width, height: height)
        let toVCEndPosition = CGRect(x: 0, y: 0, width: width, height: height)
        let fromVCEndPosition = CGRect(x: -startXPosition, y: 0, width: width, height: height)
        
        toVC.view.frame = toVCStartPosition
        toVC.view.isHidden = false
        transition(from: fromVC, to: toVC, duration: 0.3, options: [.curveEaseInOut], animations: {
            fromVC.view.frame = fromVCEndPosition
            toVC.view.frame = toVCEndPosition
            self.view.layoutIfNeeded()
        }) { (success) in
            if success {
                self.visibleVC = toVC
                fromVC.view.isHidden = true
            }
        }
    }
    
    func swipedContainerView(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.right: break
        case UISwipeGestureRecognizerDirection.left: break
        default: break
        }
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
        
        let swipeLeftGR = UISwipeGestureRecognizer(target: self, action: #selector(swipedContainerView))
        swipeLeftGR.direction = .left
        let swipeRightGR = UISwipeGestureRecognizer(target: self, action: #selector(swipedContainerView))
        swipeRightGR.direction = .right
        
        containerView.addGestureRecognizer(swipeLeftGR)
        containerView.addGestureRecognizer(swipeRightGR)
        
        let leftTapGR = UITapGestureRecognizer(target: self, action: #selector(tappedImageView))
        let centerTapGR = UITapGestureRecognizer(target: self, action: #selector(tappedImageView))
        let rightTapGR = UITapGestureRecognizer(target: self, action: #selector(tappedImageView))
        
        navigationHeaderView.leftImageView.addGestureRecognizer(leftTapGR)
        navigationHeaderView.centerImageView.addGestureRecognizer(centerTapGR)
        navigationHeaderView.rightImageView.addGestureRecognizer(rightTapGR)
        
    }

}

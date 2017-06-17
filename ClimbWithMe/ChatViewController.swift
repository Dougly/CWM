//
//  ChatViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/22/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
//    func presentFindPartnerView() {
//        let _ = navigationController?.popViewController(animated: true)
//    }
    
//    func setupNavigationBar() {
//        let image : UIImage = UIImage(named: "ic_chat_48pt")!
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = image
//        self.navigationItem.titleView = imageView
//        
//        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//        leftButton.setImage(#imageLiteral(resourceName: "logo_blue"), for: .normal)
//        leftButton.addTarget(self, action: #selector(presentFindPartnerView), for: .touchUpInside)
//        leftButton.clipsToBounds = true
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
//        
//        let rightButton = UIButton()
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
//        
//    }

    
    func setupView() {
        self.view.tag = 3
        //setupNavigationBar()
    }
}

//
//  HomeViewController.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/6/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let findPartnerView = FindPartnerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
}

extension MainViewController {
    
    func setUpViews() {
        self.view.addSubview(findPartnerView)
        self.view.setEqualConstraints(for: findPartnerView)
    }
    
}

//
//  FindPartnerView.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/6/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class FindPartnerView: UIView {
    
    let headerView = AppHeaderView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubViews()
    }

}


extension FindPartnerView {
    
    func setUpSubViews() {
        
        self.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
    
    }
}

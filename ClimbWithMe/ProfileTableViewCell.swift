//
//  ProfileTableViewCell.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/21/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        titleLabel.font = UIFont(name: "Helvetica", size: 18)
        self.contentView.addSubview(titleLabel)
        self.contentView.setEqualConstraints(for: titleLabel, navBarHeight: 0)

    }
    
    
}

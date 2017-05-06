//
//  PictureAndNameView.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/6/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class PictureAndNameView: UIView {

    let pictureImageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubviews()
    }

}

extension PictureAndNameView {
    
    func setUpSubviews() {
        
        // TODO: set name and image to match firebase user data
        pictureImageView.image = #imageLiteral(resourceName: "ic_person_48pt")
        
        nameLabel.font = UIFont(name: "Helvetica", size: 12)
        nameLabel.text = "Doug Galante"
        nameLabel.backgroundColor = .gray
        
        self.addSubview(pictureImageView)
        self.addSubview(nameLabel)
        
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        pictureImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        pictureImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pictureImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        pictureImageView.widthAnchor.constraint(equalTo: pictureImageView.heightAnchor).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: pictureImageView.trailingAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.pictureImageView.centerYAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: pictureImageView.heightAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    
        
    }
    
}

//
//  FindPartnerView.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/6/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class FindPartnerView: UIView {
    
    let pictureAndNameView = PictureAndNameView()
    let gymLabel = UILabel()
    let timeLabel = UILabel()
    let typeLabel = UILabel()
    let settingsStackView = UIStackView()
    let findPartnerButton = UIButton(type: .system)
    let viewType = ViewType.findPartnerView
    
    
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
        
        settingsStackView.alignment = .fill
        settingsStackView.distribution = .fillEqually
        settingsStackView.axis = .vertical
        
        findPartnerButton.setTitle("Find Partner", for: .normal)
        findPartnerButton.backgroundColor = .blue
        
        // TODO: change to user selected data
        gymLabel.text = "Gym: The Cliffs"
        timeLabel.text = "Time: 2:00pm"
        typeLabel.text = "Type: Sport Climbing"
        
        
        settingsStackView.addArrangedSubview(gymLabel)
        settingsStackView.addArrangedSubview(timeLabel)
        settingsStackView.addArrangedSubview(typeLabel)
        
        self.addSubview(pictureAndNameView)
        self.addSubview(settingsStackView)
        self.addSubview(findPartnerButton)
        
        pictureAndNameView.translatesAutoresizingMaskIntoConstraints = false
        settingsStackView.translatesAutoresizingMaskIntoConstraints = false
        findPartnerButton.translatesAutoresizingMaskIntoConstraints = false
        
        pictureAndNameView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pictureAndNameView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pictureAndNameView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        pictureAndNameView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/9).isActive = true
        
        settingsStackView.topAnchor.constraint(equalTo: pictureAndNameView.bottomAnchor).isActive = true
        settingsStackView.centerXAnchor.constraint(equalTo: pictureAndNameView.centerXAnchor).isActive = true
        settingsStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3).isActive = true
        settingsStackView.widthAnchor.constraint(equalTo: pictureAndNameView.widthAnchor).isActive = true
        
        findPartnerButton.topAnchor.constraint(equalTo: settingsStackView.bottomAnchor).isActive = true
        findPartnerButton.centerXAnchor.constraint(equalTo: settingsStackView.centerXAnchor).isActive = true
        findPartnerButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/9).isActive = true
        findPartnerButton.widthAnchor.constraint(equalTo: settingsStackView.widthAnchor).isActive = true
        
    
    }
}

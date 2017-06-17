//
//  ProfileControllerExtension.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 5/21/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class ProfileTableViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let dataStore = DataStore.sharedInstance
    let tableViewItems: [String] = ["Gyms", "Certifications", "Skill Level"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gymCell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as! ProfileTableViewCell
        gymCell.contentView.backgroundColor = .blue
        gymCell.titleLabel.text = tableViewItems[indexPath.row]
        
        
        return gymCell
        
    }
    
}

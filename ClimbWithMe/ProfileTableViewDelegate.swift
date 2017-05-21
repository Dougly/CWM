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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gymCell = tableView.dequeueReusableCell(withIdentifier: "gymCell")
        //let certificationsCell = tableView.dequeueReusableCell(withIdentifier: "certificationCell")
        //let climbingLevel = tableView.dequeueReusableCell(withIdentifier: "climbingLevelCell")
        
        
        return gymCell!
        
    }
    
}

enum sectionType {
    case gyms, certifications, skillLevel, logout
}

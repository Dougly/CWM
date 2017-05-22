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

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let header = tableView.dequeueReusableCell(withIdentifier: "headerCell")
        
        if let header = header {
            print("header view exists")
            header.textLabel?.text = "TESTTTT"
            header.backgroundColor = .red
        } else {
            print("no header view")
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gymCell = tableView.dequeueReusableCell(withIdentifier: "gymCell")
        gymCell?.backgroundColor = .blue
        //let certificationsCell = tableView.dequeueReusableCell(withIdentifier: "certificationCell")
        //let climbingLevel = tableView.dequeueReusableCell(withIdentifier: "climbingLevelCell")
        
        
        return gymCell!
        
    }
    
}

//
//  User.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 4/30/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class User {
    
    var uid: String
    var userEmail: String
    var name: String
    var profileImage: UIImage? = nil
    var gyms: [String] = []
    var certifications: [Certification] = []
    
    init(uid: String, userEmail: String, name: String) {
        self.uid = uid
        self.userEmail = userEmail
        self.name = name
    }
    
    
    
    func changeProfileImage(with image: UIImage) {
        self.profileImage = image
    }
}

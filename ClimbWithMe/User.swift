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
    var userName: String?
    var profileImage: UIImage? = nil
    
    init(uid: String, userEmail: String) {
        self.uid = uid
        self.userEmail = userEmail
    }
    
    
    
    func changeProfileImage(with image: UIImage) {
        self.profileImage = image
    }
}

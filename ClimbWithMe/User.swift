//
//  User.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 4/30/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class User {
    var firstName: String
    var lastName: String
    var profileImage: UIImage? = nil
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func changeName(to firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func changeProfileImage(with image: UIImage) {
        self.profileImage = image
    }
}

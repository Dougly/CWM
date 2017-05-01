//
//  UserTests.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 4/30/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import XCTest
@testable import ClimbWithMe

class UserTests: XCTestCase {
    
    let user = User(firstName: "Doug", lastName: "Galante")
    
    func testInit() {
        XCTAssert(user.firstName == "Doug", "Expected: Doug, Got: \(user.firstName)")
        XCTAssert(user.lastName == "Galante", "Expected: Galante, Got: \(user.lastName)")
    }
    
    func testChangeName() {
        user.changeName(to: "Teddy", lastName: "Papes")
        XCTAssert(user.firstName == "Teddy", "Expected: Teddy, Got: \(user.firstName)")
        XCTAssert(user.lastName == "Papes", "Expected: Papes, Got: \(user.lastName)")
    }
    
    func testChangeProfileImage() {
        user.changeProfileImage(with: #imageLiteral(resourceName: "ic_photo_camera_48pt"))
        XCTAssert(user.profileImage == #imageLiteral(resourceName: "ic_photo_camera_48pt"))
    }
    
}

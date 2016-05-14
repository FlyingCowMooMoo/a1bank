//
//  User.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 10/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

class User: Hashable {
    var id: Int32
    
    
    var firstName: String
    
    var lastName: String
    
    var userName: String
    
    var password: String
    
    var email: String
    
    var dateOfBirth: NSDate
    
    
    init(id: Int32, userName: String, password: String, firstName: String, lastName: String, email: String, dateOfBirth: NSDate) {
        self.id = id
        self.userName = userName
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.dateOfBirth = dateOfBirth
    }
    
    
    var hashValue: Int {
        get {
            return self.id.hashValue
        }
    }
}


func ==(lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id
}
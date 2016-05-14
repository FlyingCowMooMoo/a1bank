//
//  User.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 10/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

class User: Hashable {
    var id: CUnsignedLong
    
    
    var firstName: String
    
    var lastName: String
    
    var userName: String
    
    var password: String
    
    
    init(id: CUnsignedLong, userName: String, password: String) {
        self.id = id
        self.userName = userName
        self.password = password
    }
    
    init(id: CUnsignedLong, userName: String, password: String, firstName: String, lastName: String) {
        self.id = id
        self.userName = userName
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
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
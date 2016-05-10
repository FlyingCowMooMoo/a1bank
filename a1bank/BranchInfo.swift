//
//  BranchInfo.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 10/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

class BranchInfo: Hashable {
    var id: CUnsignedLong
    
    var friendlyName: String
    
    var address: String
    
    init(id: CUnsignedLong, friendlyName: String, address: String) {
        self.id = id
        self.friendlyName = friendlyName
        self.address = address
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

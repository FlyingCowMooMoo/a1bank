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
    
    var address: String
    
    var comments: String
    
    
    init(id: CUnsignedLong, address: String) {
        self.id = id
        self.address = address
        self.comments = "We open when we feel like so"
    }
    
    
    var hashValue: Int {
        get {
            return self.id.hashValue
        }
    }
}


func ==(lhs: BranchInfo, rhs: BranchInfo) -> Bool {
    return lhs.id == rhs.id
}
//
//  BankAccount.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 10/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

class BankAccount: Hashable {
    var id: CUnsignedLong
    
    var balance: Double
    
    var friendlyName: String
    
    var currency: String
    
    //The id of the user that owns this account
    var owner: CUnsignedLong
    
    init(id: CUnsignedLong, balance: Double, ownerId: CUnsignedLong, friendName: String) {
        self.id = id
        self.balance = balance
        self.owner = ownerId
        self.friendlyName = friendName
        self.currency = "AUD"
    }
    init(id: CUnsignedLong, balance: Double, ownerId: CUnsignedLong, friendName: String, currency: String) {
        self.id = id
        self.balance = balance
        self.owner = ownerId
        self.friendlyName = friendName
        self.currency = currency
    }
    
    
    var hashValue: Int {
        get {
            return self.id.hashValue
        }
    }
}


func ==(lhs: BankAccount, rhs: BankAccount) -> Bool {
    return lhs.id == rhs.id
}
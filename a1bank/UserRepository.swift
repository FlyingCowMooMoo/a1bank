//
//  UserRepository.swift
//  a1bank
//
//  Created by Panagiotis Papastamatis on 21/03/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

import CoreData


class UserRepository {

    init()
    {
        let path = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory, .UserDomainMask, true
            ).first!
        
        let db = try Connection("\(path)/bankdb.sqlite3")
    }


    func getUser(userName: String) -> User?
    {
        

        return nil
    }

    func createUser(userName: String, password: String) -> Bool {
        if (getUser(userName) != nil) {
            return false
        }
        return true
    }

}



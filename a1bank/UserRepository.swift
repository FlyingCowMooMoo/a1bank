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



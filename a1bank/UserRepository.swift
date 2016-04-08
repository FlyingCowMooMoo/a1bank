//
//  UserRepository.swift
//  a1bank
//
//  Created by Panagiotis Papastamatis on 21/03/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

class UserRepository {
    private var users = Set<User>()

    init() {
    }


    func getUser(userName: String) -> User? {
        for user in users {
            if (user.userName.lowercaseString == userName.lowercaseString) {
                return user
            }
        }

        return nil
    }

    func createUser(userName: String, password: String) -> Bool {
        if (getUser(userName) != nil) {
            return false
        }

        self.users.insert(User(id: CUnsignedLong(users.count), userName: userName, password: password))
        return true
    }

}



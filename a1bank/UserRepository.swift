//
//  UserRepository.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 21/03/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

class UserRepository {
    var users = Set<User>()


    init() {
        self.createUser("user1", "user")
        self.createUser("user2", password: "user")
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

        self.users.insert(User(id: users.count + 1, userName: userName, password: password))
        return true
    }

}



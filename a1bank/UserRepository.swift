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

    init() {
    }


    func getUser(userName: String) -> User?
    {
        let userFetch = NSFetchRequest(entityName: "User)
        let moc = DataController().managedObjectContext
        
        do {
            
            let user = try moc.executeFetchRequest(personFetch) as! [User]
            return user
            
        }
        catch
        {
            fatalError("Failed to fetch person: \(error)")
        }
        

        return nil
    }

    func createUser(userName: String, password: String) -> Bool {
        if (getUser(userName) != nil) {
            return false
        }
        let moc = DataController().managedObjectContext

        self.users.insert(User(id: CUnsignedLong(users.count), userName: userName, password: password))
        return true
    }

}



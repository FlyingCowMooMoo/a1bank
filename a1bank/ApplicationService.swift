//
// Created by Panagiotis Papastamatis on 21/03/2016.
// Copyright (c) 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

class ApplicationService {

    var userRepository = UserRepository()
    var bankAccountRepository = BankAccountRepository()
    
    static let instance = ApplicationService()
    
    private init()
    {
        
    }
    
    static func populateData()
    {
        let numberOfUsers = Int(arc4random_uniform(20) + 10)
        //populate dummy data
        for var i = 0; i < numberOfUsers; ++i
        {
            if (instance.userRepository.createUser("user\(i)", password: "password")) {
                
                let account = instance.userRepository.getUser("user\(i)")
                if (account != nil) {
                    let numberOfAccounts = Int(arc4random_uniform(20) + 10)
                    for var j = 0; j < numberOfAccounts; ++j {
                        instance.bankAccountRepository.createAccount(Double(numberOfAccounts) + 1.5 * Double(numberOfUsers), ownerId:account!.id,
                            friendlyName: "Personal Savings\(j)")
                    }
                }
            }
        }
    }
    

    static func authenticateUser(userName: String, password: String) -> Bool {
        let user = instance.userRepository.getUser(userName)

        if let user = instance.userRepository.getUser(userName) {
            if (user.password == password) {
                return true
            }
        }

        return false
    }

    static func getUserAccounts(userName: String) -> Set<BankAccount> {
        var accs = Set<BankAccount>()
        var user = instance.userRepository.getUser(userName)

        print("Getting account for user " + userName)
        if let user = instance.userRepository.getUser(userName) {
            accs = instance.bankAccountRepository.getAllAccountsOfUser(user.id)
            print("Valid user")
        }
        print("NUmber of accounts is " + String(accs.count))
        return accs
    }
    



}

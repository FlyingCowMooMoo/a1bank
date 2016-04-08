//
// Created by Panagiotis Papastamatis on 21/03/2016.
// Copyright (c) 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation


class ApplicationService {

    var userRepository: UserRepository?
    var bankAccountRepository: BankAccountRepository?
    
    static let applicationService = ApplicationService()

    init() {
        self.bankAccountRepository = BankAccountRepository()
        self.userRepository = UserRepository()

        //populate dummy data
        for var i = 0; i < 20; ++i {
            if (self.userRepository!.createUser("user\(i)", password: "password")) {
                
                let account = self.userRepository!.getUser("user\(i)")
                if (account != nil) {
                    let numberOfAccounts = Int(arc4random_uniform(UInt32(5)))
                    for var j = 0; j < numberOfAccounts; ++j {
                        self.bankAccountRepository!.createAccount(Double(numberOfAccounts) * 1.3, ownerId: account!.id,
                                friendlyName: "Personal Savings\(j)")
                    }
                }
            }
        }
    }

    func authenticateUser(userName: String, password: String) -> Bool {
        let user = self.userRepository!.getUser(userName)

        if let user = self.userRepository!.getUser(userName) {
            if (user.password == password) {
                return true
            }
        }

        return false
    }

    func getUserAccounts(userName: String) -> Set<BankAccount> {
        var accs = Set<BankAccount>()
        var user = self.userRepository!.getUser(userName)

        if let user = self.userRepository!.getUser(userName) {
            accs = self.bankAccountRepository!.getAllAccountsOfUser(user.id)
        }
        return accs
    }


}

//
// Created by Panagiotis Papastamatis on 21/03/2016.
// Copyright (c) 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation


class BankAccountRepository {

    private var accounts = Set<BankAccount>()
    
    init() {
    }

    func createAccount(id: CUnsignedLong, balance: Double, ownerId: CUnsignedLong, friendlyName: String, currency: String) -> Bool {
        let b = BankAccount(id: id, balance: balance, ownerId: ownerId,
            friendName: friendlyName, currency: currency)
        self.accounts.insert(b)
        
        print(b)
        return true
    }

    func getAccount(id: CUnsignedLong) -> BankAccount? {
        for account in self.accounts {
            if (account.id == id) {
                return account
            }
        }

        return nil
    }

    func getAllAccountsOfUser(userId: CUnsignedLong) -> Set<BankAccount> {
        var acc = Set<BankAccount>()
        for account in self.accounts {
            if (account.owner == userId) {
                acc.insert(account)
            }
        }

        return acc

    }
    

}

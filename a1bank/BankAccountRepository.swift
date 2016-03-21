//
// Created by Panagiotis Papasyamatis on 21/03/2016.
// Copyright (c) 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation


class BankAccountRepository {

    var accounts = Set<BankAccount>()

    init() {
    }

    func createAccount(balance: Double, ownerId: CUnsignedLong, friendlyName: String) -> Bool {
        for account in self.accounts {
            if (account.id == ownerId) {
                return false
            }
        }

        self.accounts.insert(BankAccount(id: CUnsignedLong(accounts.count + 1), balance: balance, ownerId: ownerId,
                friendName: friendlyName))
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

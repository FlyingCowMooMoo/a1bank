//
// Created by Panagiotis Papasyamatis on 21/03/2016.
// Copyright (c) 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

class BankAccountRepository {
    var accounts = Set<BankAccount>()

    init() {

    }

    func createAccount(userId: CUnsignedLong, balance: Double) {
        self.accounts.insert(BankAccount(accounts.count + 1))
    }
}

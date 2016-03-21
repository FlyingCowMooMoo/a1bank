//
// Created by Panagiotis Papasyamatis on 21/03/2016.
// Copyright (c) 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

class BankAccount {
    var id: CUnsignedLong

    var balance: Double

    var friendlyName: String

    //The id of the user that owns this account
    var owner: CUnsignedLong
}

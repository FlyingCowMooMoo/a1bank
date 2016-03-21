//
// Created by Panagiotis Papasyamatis on 21/03/2016.
// Copyright (c) 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

class User: Hashable {
    var id: CUnsignedLong

    var userName: String

    var password: String

    init(id: CUnsignedLong, userName: String, password: String) {
        self.id = id
        self.userName = userName
        self.password = password
    }


}

func ==(lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id
}
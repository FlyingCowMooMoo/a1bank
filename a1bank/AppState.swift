//
//  AppState.swift
//  a1bank
//
// Holds the information about the state app in a singleton
//
//  Created by Panagiotis Papastamatis on 9/04/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

class AppState
{
    static let sharedInstance = AppState()
    
    private init(){}
    
    var isLoggedIn:Bool = false
    var hasLoginErrors:Bool = false
    var currentUser:String!
    
}

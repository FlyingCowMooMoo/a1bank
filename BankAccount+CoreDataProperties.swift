//
//  BankAccount+CoreDataProperties.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 10/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension BankAccount {

    @NSManaged var accountType: String?
    @NSManaged var balance: NSNumber?
    @NSManaged var friendlyName: String?
    @NSManaged var belongsTo: BankAccount?

}

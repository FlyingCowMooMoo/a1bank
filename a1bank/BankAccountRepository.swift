//
// Created by Panagiotis Papastamatis on 21/03/2016.
// Copyright (c) 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

import CoreData

import UIKit


class BankAccountRepository {

    
    init() {
    }
    
    func saveAccount(acc: BankAccount) -> Bool
    {
        return createAccount(acc.id, balance: acc.balance, ownerId: acc.owner, friendlyName: acc.friendlyName, currency: acc.currency)
    }

    func createAccount(id: Int32, balance: Double, ownerId: Int32, friendlyName: String, currency: String) -> Bool {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDelegate.managedObjectContext
        
        let u = NSEntityDescription.insertNewObjectForEntityForName("BankAccounts", inManagedObjectContext: context)
        
        u.setValue(NSNumber(int: id), forKey: "id")
        u.setValue(balance, forKey: "balance")
        u.setValue(NSNumber(int: ownerId), forKey: "owner")
        u.setValue(friendlyName, forKey: "friendlyName")
        u.setValue(currency, forKey: "currency")
        do {
            try context.save()
        } catch _ {
            return false
        }
        
        print(u)
        
        return true
    }

    func getAccount(id: Int32) -> BankAccount? {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDelegate.managedObjectContext
        
        let request = NSFetchRequest(entityName: "BankAccounts")
        request.returnsObjectsAsFaults = false;
        request.predicate = NSPredicate(format: "id = %@", id)
        var results: NSArray
        
        do {
            results = try context.executeFetchRequest(request)
        } catch _ {
            return nil
        }
        
        if(results.count < 0)
        {
            return nil
        }
        else
        {
            let r = results[0] as! NSManagedObject
            let id = r.valueForKey("id") as! Int
            let balance = r.valueForKey("balance") as! Double;
            let owner = r.valueForKey("owner") as! Int32;
            let friendlyName = r.valueForKey("friendlyName") as! String;
            let currency = r.valueForKey("currency") as! String;
            
            
            return BankAccount(id: Int32(id), balance: balance, ownerId: owner, friendName: friendlyName, currency: currency)
        }
        
    }

    func getAllAccountsOfUser(userId: Int32) -> Set<BankAccount>
    {
        var acc = Set<BankAccount>()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDelegate.managedObjectContext
        
        let request = NSFetchRequest(entityName: "BankAccounts")
        request.returnsObjectsAsFaults = false;
        request.predicate = NSPredicate(format: "owner = %i", userId)
        var results: NSArray
        
        do {
            results = try context.executeFetchRequest(request)
        } catch _ {
            return acc
        }
        
        if(results.count < 0)
        {
            return acc
        }
        else
        {
            for res in results
            {
                let r = res as! NSManagedObject
                let id = r.valueForKey("id") as! Int
                var balance = r.valueForKey("balance") as! Double;
                let owner = r.valueForKey("owner") as! Int32;
                let friendlyName = r.valueForKey("friendlyName") as! String;
                let currency = r.valueForKey("currency") as! String;
                let b = BankAccount(id: Int32(id), balance: balance, ownerId: owner, friendName: friendlyName, currency: currency)
                acc.insert(b)
            }
            
        }
        

        return acc

    }
    

}

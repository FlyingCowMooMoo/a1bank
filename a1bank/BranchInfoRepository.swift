//
//  BranchInfoRepository.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 15/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

import CoreData

import UIKit



class BranchInfoRepository
{
    func createBranch(id: Int32, address: String) -> Bool
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDelegate.managedObjectContext
        
        let u = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        u.setValue(NSNumber(int: id), forKey: "id")
        u.setValue(address, forKey: "address")
        do {
            try context.save()
        } catch _ {
            return false
        }
        
        print(u)
        
        return true
    }
    
    
    func getAll() -> Set<BranchInfo>
    {
        var data = Set<BranchInfo>()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context:NSManagedObjectContext = appDelegate.managedObjectContext
        
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false;
        var results: NSArray
        
        do {
            results = try context.executeFetchRequest(request)
        } catch _ {
            return data
        }
        
        for res in results
        {
            let r = res as! NSManagedObject
            let id = r.valueForKey("id") as! Int;
            let address = r.valueForKey("address") as! String;
            let v = BranchInfo(id: Int32(id), address: address)
            data.insert(v)
            
        }
        return data
    }
}
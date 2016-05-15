//
// Created by Panagiotis Papastamatis on 21/03/2016.
// Copyright (c) 2016 Panagiotis Papastamatis. All rights reserved.
//

import Foundation

import CoreData

import UIKit

class ApplicationService {
    
    var userRepository = UserRepository()
    var bankAccountRepository = BankAccountRepository()
    var branchInfoRepository = BranchInfoRepository()
    
    static let instance = ApplicationService()
    
    private init()
    {
        
    }
    
    static func populateData()
    {
        dropTable("Users")
        dropTable("BankAccounts")
        dropTable("BranchInfo")
        populateDummyAccounts()
        populateDummyUsers()
        populateDummyBranches()
    }
    
    
    static func authenticateUser(userName: String, password: String) -> Bool {
        
        if let user = instance.userRepository.getUser(userName) {
            if (user.password == password) {
                return true
            }
        }
        
        return false
    }
    
    static func getUserAccounts(userName: String) -> Set<BankAccount> {
        var accs = Set<BankAccount>()
        print("Getting account for user " + userName)
        if let user = instance.userRepository.getUser(userName) {
            accs = instance.bankAccountRepository.getAllAccountsOfUser(user.id)
            print("Valid user")
        }
        print("NUmber of accounts is " + String(accs.count))
        return accs
    }
    
    static func getBranches() -> Set<BranchInfo>
    {
        return instance.branchInfoRepository.getAll()
    }
    
    
    private static func dropTable(tableName: String)
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: tableName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.executeRequest(deleteRequest)
            try context.save()
        }
        catch let error as NSError {
            print(error)
        }
    }
    
    
    private static func populateDummyAccounts() -> Bool
    {
        
        do
        {
            
            if let path = NSBundle.mainBundle().pathForResource("dummyaccounts", ofType: "csv")
            {
                let data = try String(contentsOfFile:path, encoding: NSUTF8StringEncoding)
                
                let myStrings = data.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
                for str in myStrings
                {
                    let parts = str.componentsSeparatedByString(",")
                    if(parts.count > 3)
                    {
                        let id = Int32(parts[0])
                        let name = parts[1]
                        let currency = parts[2]
                        let balance = Double(parts[3])
                        let owner = Int32(parts[4])
                        
                        instance.bankAccountRepository.createAccount(id!, balance: balance!, ownerId: owner!, friendlyName: name, currency: currency)
                    }
                }
            }
        }
        catch let err as NSError
        {
            print(err)
        }
        
        return true
    }
    
    private static func populateDummyBranches() -> Bool
    {
        
        do
        {
            
            if let path = NSBundle.mainBundle().pathForResource("dummybranches", ofType: "csv")
            {
                let data = try String(contentsOfFile:path, encoding: NSUTF8StringEncoding)
                
                let myStrings = data.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
                for str in myStrings
                {
                    let parts = str.componentsSeparatedByString(",")
                    if(parts.count > 1)
                    {
                        let id = Int32(parts[0])
                        let address = parts[1]
                        instance.branchInfoRepository.createBranch(id!, address: address)
                    }
                }
            }
        }
        catch let err as NSError
        {
            print(err)
        }
        
        return true
    }
    
    private static func populateDummyUsers() -> Bool
    {
        
        do
        {
            
            if let path = NSBundle.mainBundle().pathForResource("dummyusers", ofType: "csv")
            {
                let data = try String(contentsOfFile:path, encoding: NSUTF8StringEncoding)
                
                let myStrings = data.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
                print(myStrings.count)
                for str in myStrings
                {
                    let parts = str.componentsSeparatedByString(",")
                    if(parts.count > 5)
                    {
                        let id = Int32(parts[0])
                        let fname = parts[1]
                        let lname = parts[2]
                        let email = parts[3]
                        let password = parts[4]
                        let username = parts[5]
                        let dateString = parts[6]
                        let dateFormatter = NSDateFormatter()
                        dateFormatter.dateFormat = "d/m/yyyy"
                        let date = dateFormatter.dateFromString( dateString )
                        
                        instance.userRepository.createUser(id!, userName: username, password: password, firstName: fname, lastName: lname, dob: date!, email: email)
                    }

                }
            }
        }
        catch let err as NSError
        {
            print(err)
        }
        
        return true
    }
    
    
}

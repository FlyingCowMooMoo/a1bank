//
//  AccountViewController.swift
//  a1bank
//
//  Created by Panagiotis Papastamatis on 28/03/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var applicationService = ApplicationService.instance

    
    @IBOutlet weak var accountsTableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var accountHolderNameValue: UILabel!
    var accounts = []
    var username : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(username)
        //Convert to array cause I am not sure how to bind sets to a table view
        accounts = Array(ApplicationService.getUserAccounts(username))
        print(accounts)
        
        accountsTableView.delegate = self
        accountsTableView.dataSource = self
        
        //register custom cell from nib
        
    }


    @IBAction func logoutPressed(sender: UIButton)
    {
        //TODO:Handle User Logout
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.accounts.count)
        return self.accounts.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.registerNib(UINib(nibName: "BankAccountListViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        var cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! BankAccountTableCell
        cell.account = self.accounts[indexPath.row] as! BankAccount
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("WebSegue", sender: indexPath)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}

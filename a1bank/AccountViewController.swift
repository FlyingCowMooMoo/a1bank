//
//  AccountViewController.swift
//  a1bank
//
//  Created by Panagiotis Papastamatis on 28/03/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var applicationService = ApplicationService.applicationService

    
    @IBOutlet weak var accountsTableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var accountHolderNameValue: UILabel!
    var accounts = []
    var username : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Convert to array cause I am not sure how to bind sets to a table view
        accounts = Array(applicationService.getUserAccounts(username))
        
        accountsTableView.delegate = self
        accountsTableView.dataSource = self
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
        return self.accounts.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! BankAccountListViewCell
        cell.bankAccount = self.accounts[indexPath.row] as! BankAccount
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("WebSegue", sender: indexPath)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}

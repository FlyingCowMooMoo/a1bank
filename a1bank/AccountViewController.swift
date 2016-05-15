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

    
    @IBOutlet var tableView: UITableView!
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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        var nib = UINib(nibName: "accountViewTableCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        accountHolderNameValue.text = username
        
        self.tableView.rowHeight = 64.0

        
    }


    @IBAction func logoutPressed(sender: UIButton)
    {
        AppState.sharedInstance.isLoggedIn = false
        AppState.sharedInstance.hasLoginErrors = false
        AppState.sharedInstance.currentUser = nil
        let controller = storyboard?.instantiateViewControllerWithIdentifier("homeViewController") as!HomeController
        presentViewController(controller, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let n = self.accounts.count ?? 0
        if(n == 0)
        {
            print("Oops no accounts found")
        }
        return n
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:AccountTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! AccountTableViewCell
        let account = self.accounts[indexPath.row] as! BankAccount
        cell.accountNameLabel.text = account.friendlyName
        cell.accountBalanceLabel.text = "$" + String(account.balance)
        cell.currencyLabel.text = account.currency
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let acc:BankAccount = self.accounts[indexPath.row] as! BankAccount
        let controller = storyboard?.instantiateViewControllerWithIdentifier("bankAccountViewController") as!BankAccountViewController
        controller.account = acc
        //controller.accountIdLabelValue.text = String(acc.id)
        //controller.accountNameLabelValue.text = acc.friendlyName
        //controller.balanceLabelValue.text = "$" + String(acc.balance)
        presentViewController(controller, animated: true, completion: nil)
    }

}

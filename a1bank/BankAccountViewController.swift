//
//  BankAccountViewController.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 28/03/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit

class BankAccountViewController: UIViewController {

    @IBOutlet weak var accountNameLabelValue: UILabel!
    @IBOutlet weak var accountIdLabelValue: UILabel!
    @IBOutlet weak var balanceLabelValue: UILabel!
    
    
    var account:BankAccount!
    
    
    @IBAction func topUpPressed(sender: UIButton) {
        //topUpViewController
        let controller = storyboard?.instantiateViewControllerWithIdentifier("topUpViewController") as!TopUpViewController
        controller.fundingAccount = self.account
        controller.targetAccount = self.account
        presentViewController(controller, animated: true, completion: nil)
    }
    @IBAction func backButtonPressed(sender: UIButton)
    {
        let controller = storyboard?.instantiateViewControllerWithIdentifier("accountViewController") as!AccountViewController
        controller.username = AppState.sharedInstance.currentUser
        presentViewController(controller, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if(account == nil)
        {
            let alert = UIAlertController(title: "Error", message: "An error occured while loading the details of this account, please try again later", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        self.accountNameLabelValue.text = String(self.account.friendlyName)
        self.accountIdLabelValue.text = String(self.account.id)
        self.balanceLabelValue.text = "$" + String(account.balance)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

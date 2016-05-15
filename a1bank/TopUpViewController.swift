//
//  TopUpViewController.swift
//  a1bank
//
//  Created by Panagiotis Papastamatis on 15/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//
import UIKit

class TopUpViewController: UIViewController
{
    var targetAccount:BankAccount!
    var fundingAccount:BankAccount!
    var accounts = []
    
    var rate = 0.0
    
    @IBOutlet var targetAccountName: UILabel!
    
    @IBOutlet var targetAccountBalance: UILabel!
    
    @IBOutlet var targetAccountCurrency: UILabel!
    
    @IBOutlet var fundingAccountName: UILabel!
    
    @IBOutlet var fundingAccountBalance: UILabel!
    
    @IBOutlet var fundingAccountCurrency: UILabel!
    
    @IBOutlet var targetCurrencyLabel: UILabel!
    @IBOutlet var fundingCurrencyLabel: UILabel!
    
    
    @IBOutlet var exchangeRateLabel: UILabel!
    
    
    
    @IBOutlet var targetTextField: UITextField!
    @IBOutlet var fundingTextField: UITextField!
    @IBAction func changeSourcePressed(sender: UIButton)
    {
        var pickerData: [[String : String]] = []
        
        for acc in self.accounts as! [BankAccount]
        {
            if acc.id != targetAccount.id
            {
                let entry = ["value": String(acc.id), "display": acc.currency + " - " + acc.friendlyName]
                pickerData.append(entry)
            }
        }
        
        PickerDialog().show("Bank Account", options: pickerData) {
            (value) -> Void in
            print(value)
            let val = Int(value)
            self.fundingAccount = ApplicationService.getAccount(Int32(val!))
            self.updateFundingAccountLabels()
            self.updateExchangeRateLabel()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cu = AppState.sharedInstance.currentUser
        self.accounts = Array(ApplicationService.getUserAccounts(cu))
        self.updateFundingAccountLabels()
        self.updateTargetAccountLabels()
        
        self.targetTextField.text = "1"
    
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    
    @IBAction func targetChanged(sender: AnyObject)
    {
        if targetTextField.text?.isEmpty == false
        {
            let tg = Double(targetTextField.text!)
            if tg != nil
            {
                let rr = 1.00 / rate
                fundingTextField.text = String(rr * tg!)
            }
        }
    }
    @IBAction func fundingChanged(sender: AnyObject)
    {
        if fundingTextField.text?.isEmpty == false
        {
            let fd = Double(fundingTextField.text!)
            if fd != nil
            {
                targetTextField.text = String(fd! * self.rate)
            }
        }
    }
    
    private func updateExchangeRateLabel()
    {
        do {
            self.rate = try Currency.getCurrencyData(fundingAccount.currency, currencyB: targetAccount.currency)
            self.exchangeRateLabel.text = "1 " + fundingAccount.currency + " = " + String(self.rate) + " " + targetAccount.currency
        } catch {
            print("An error occurred.")
        }
        
    }
    
    private func updateTargetAccountLabels()
    {
        self.targetAccountName.text = self.targetAccount.friendlyName
        self.targetAccountBalance.text = String(self.targetAccount.balance)
        self.targetAccountCurrency.text = self.targetAccount.currency
        self.targetCurrencyLabel.text = self.targetAccount.currency
    }
    
    private func updateFundingAccountLabels()
    {
        self.fundingAccountName.text = self.fundingAccount.friendlyName
        self.fundingAccountBalance.text = String(self.fundingAccount.balance)
        self.fundingAccountCurrency.text = self.fundingAccount.currency
        self.fundingCurrencyLabel.text = self.fundingAccount.currency
    }
    
    @IBAction func submitPressed(sender: UIButton)
    {
        let fd = Double(fundingTextField.text!)
        let tg = Double(targetTextField.text!)
        if fundingTextField.text?.isEmpty == true || targetTextField.text?.isEmpty == true
        {
            popup("Error", msg: "Some information is missing")
            return
        }
        
        if fd > fundingAccount.balance
        {
            popup("Error", msg: "Insufficient Funds")
            return
        }
        
        self.fundingAccount.balance = self.fundingAccount.balance - fd!
        self.targetAccount.balance = self.targetAccount.balance + tg!
        
        let resA = ApplicationService.saveAccount(self.fundingAccount)
        let resB = ApplicationService.saveAccount(self.targetAccount)
        
        if resA == true && resB == true
        {
            popup("Ok", msg: "You bought moneyz")
            return
        }
        else
        {
            popup("Error", msg: "Failed to buy money, please try again latert")
        }
        
    }
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    @IBAction func backPressed(sender: UIButton) {
        let controller = storyboard?.instantiateViewControllerWithIdentifier("accountViewController") as!AccountViewController
        controller.username = AppState.sharedInstance.currentUser
        presentViewController(controller, animated: true, completion: nil)
    }
    private func popup(title: String, msg: String)
    {
        var refreshAlert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            print("Ok")
        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
    }
}

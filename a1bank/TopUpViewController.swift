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
    
    @IBOutlet var targetAccountName: UILabel!
    
    @IBOutlet var targetAccountBalance: UILabel!
    
    @IBOutlet var targetAccountCurrency: UILabel!
    
    @IBOutlet var fundingAccountName: UILabel!
    
    @IBOutlet var fundingAccountBalance: UILabel!
    
    @IBOutlet var fundingAccountCurrency: UILabel!
    
    @IBOutlet var targetCurrencyLabel: UILabel!
    @IBOutlet var fundingCurrencyLabel: UILabel!
    
    
    @IBOutlet var exchangeRateLabel: UILabel!
    
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
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cu = AppState.sharedInstance.currentUser
        self.accounts = Array(ApplicationService.getUserAccounts(cu))
        self.updateFundingAccountLabels()
        self.updateTargetAccountLabels()
        
        
    }
    
    private func updateExchangeRateLabel()
    {
        self.exchangeRateLabel.text = "Lol"
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
}

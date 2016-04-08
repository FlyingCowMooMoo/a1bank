//
//  BankAccountListViewCell.swift
//  a1bank
//
//  Created by Panagiotis Papastamatis on 8/04/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit

class BankAccountListViewCell: UITableViewCell {

    @IBOutlet weak var bankAccountNameValue: UILabel!
    @IBOutlet weak var bankAccountBalanceValue: UILabel!
    
    var bankAccount: BankAccount!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bankAccountNameValue.text = bankAccount.friendlyName
        bankAccountBalanceValue.text = String(bankAccount.balance)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

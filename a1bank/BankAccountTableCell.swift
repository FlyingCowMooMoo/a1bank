//
//  BankAccountTableCell.swift
//  a1bank
//
//  Created by Panagiotis Papastamatis on 9/04/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit

class BankAccountTableCell: UITableViewCell {

    @IBOutlet weak var accountNameValue: UILabel!
    @IBOutlet weak var accountBalanceValue: UILabel!
    
    var account:BankAccount!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accountNameValue.text = self.account.friendlyName
        self.accountBalanceValue.text = String(self.account.balance)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

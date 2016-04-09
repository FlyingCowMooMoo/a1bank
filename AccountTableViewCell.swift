//
//  AccountTableViewCell.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 9/04/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet var accountNameLabel: UILabel!
    @IBOutlet var accountBalanceLabel: UILabel!
    @IBOutlet var accountDetailsButton: UIButton!
    @IBOutlet var accountLabel: UILabel!
    @IBOutlet var balanceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

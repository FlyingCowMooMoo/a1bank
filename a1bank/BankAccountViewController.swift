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
    
    
    
    @IBAction func backButtonPressed(sender: UIButton)
    {
        //TODO: Go back
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

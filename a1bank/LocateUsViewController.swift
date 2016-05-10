//
//  LocateUsViewController.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 10/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit
import MapKit

class LocateUsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let acc:BankAccount = self.accounts[indexPath.row] as! BankAccount
        //let controller = storyboard?.instantiateViewControllerWithIdentifier("bankAccountViewController") as!BankAccountViewController
        //controller.account = acc
        //controller.accountIdLabelValue.text = String(acc.id)
        //controller.accountNameLabelValue.text = acc.friendlyName
        //controller.balanceLabelValue.text = "$" + String(acc.balance)
        //presentViewController(controller, animated: true, completion: nil)
    }

}

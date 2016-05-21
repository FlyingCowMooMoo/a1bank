//
//  TodayViewController.swift
//  currencyWidget
//
//  Created by Panagiotis Papasyamatis on 15/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    var timer : NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         timer = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: "updateLabel", userInfo: nil, repeats: true)
        updateLabel()
    }
    
    @IBOutlet var label: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabel()
    {
        do
        {
            let currency = Utils.getRandomCurrency()
            let rate = try Currency.getCurrencyData("AUD", currencyB: currency)
            self.label.text = "1 " + Utils.getCurrencySymbol("AUD") + " = " + String(rate) + " " + Utils.getCurrencySymbol(currency)
        } catch
        {
            self.label.text = "An error occurred."
        }
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}

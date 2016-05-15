//
//  HomeController.swift
//  a1bank
//
//  Created by Panagiotis Papastamatis on 28/03/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet var contactUsButton: UIButton!
    
    @IBOutlet var locateUsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func locateUsPressed(sender: UIButton)
    {
        
        let controller = storyboard?.instantiateViewControllerWithIdentifier("locateUsViewController") as! LocateUsViewController
        presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func contactUsPressed(sender: UIButton)
    {
        let controller = storyboard?.instantiateViewControllerWithIdentifier("aboutUsViewController") as! AboutViewController
        presentViewController(controller, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

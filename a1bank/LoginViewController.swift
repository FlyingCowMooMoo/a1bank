//
//  LoginViewController.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 28/03/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    private var applicationService = ApplicationService.applicationService
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func processLogin(sender: UIButton) {
        let username:String = usernameText.text! as String
        let password:String = passwordText.text! as String
        
        let result = applicationService.authenticateUser(username, password: password as String)
        if(result)
        {
            let controller  = storyboard?.instantiateViewControllerWithIdentifier("accountViewController") as! AccountViewController
            controller.username = username
            presentViewController(controller, animated: true, completion: nil)
        }
        errorLabel.text = "Invalid credentials, please try again!"
        errorLabel.highlighted = true
        errorLabel.enabled = true
    }
    
    @IBAction func handleForgotPassword(sender: UIButton)
    {
        //TODO: Go to contact us page
    }
  
}

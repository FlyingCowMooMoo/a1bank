//
//  LoginViewController.swift
//  a1bank
//
//  Created by Panagiotis Papastamatis on 28/03/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    private var applicationService = ApplicationService.applicationService
    @IBOutlet weak var errorLabel: UILabel!
    var hasErrors:Bool = false
    var validUsername:String!
    override func viewDidLoad() {
        
        self.applicationService = ApplicationService.applicationService
        
        super.viewDidLoad()
        if(self.hasErrors == false)
        {
            errorLabel.hidden = true
            errorLabel.enabled = false
        }
        else
        {
            errorLabel.hidden = false
            errorLabel.enabled = true
        }

        
        //hide the keyboard on touch outside of text area(s)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
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
            //let controller  = storyboard?.instantiateViewControllerWithIdentifier("accountViewController") as! //AccountViewController
            //controller.username = username
            //presentViewController(controller, animated: true, completion: nil)
            self.validUsername = username
            self.performSegueWithIdentifier("showAccountSegue", sender: username)
            
        }
        errorLabel.text = "Invalid credentials, please try again!"
        errorLabel.highlighted = true
        errorLabel.enabled = true
    }
    
    @IBAction func handleForgotPassword(sender: UIButton)
    {
        //TODO: Go to contact us page
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        if (segue.identifier == "showAccountSegue")
        {
            let destinationViewController = segue.destinationViewController as! AccountViewController
            let value = sender as! String
            destinationViewController.username = value
        }
    }
  
}

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
    private var applicationService = ApplicationService.instance
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        
        self.applicationService = ApplicationService.instance
        
        super.viewDidLoad()
        if(AppState.sharedInstance.hasLoginErrors == false)
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
        
        let result = ApplicationService.authenticateUser(username, password: password as String)
        if(result)
        {
            AppState.sharedInstance.isLoggedIn = true
            AppState.sharedInstance.currentUser = username
            self.performSegueWithIdentifier("showAccountSegue", sender: username)
            
        }
        else
        {
            print("no")
            errorLabel.highlighted = false
            errorLabel.hidden = true
            errorLabel.enabled = true
            AppState.sharedInstance.hasLoginErrors = true
            errorLabel.text = "Invalid credentials, please try again!"
            errorLabel.highlighted = true
            errorLabel.hidden = false
            errorLabel.enabled = true
            
        }
    }
    
    @IBAction func handleForgotPassword(sender: UIButton)
    {
        let controller = storyboard?.instantiateViewControllerWithIdentifier("aboutUsViewController") as! AboutViewController
        presentViewController(controller, animated: true, completion: nil)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool
    {
        if(identifier == "showAccountSegue")
        {
            return AppState.sharedInstance.isLoggedIn
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        if (segue.identifier == "showAccountSegue")
        {
            let destinationViewController = segue.destinationViewController as! AccountViewController
            destinationViewController.username = AppState.sharedInstance.currentUser
        }
    }
  
}

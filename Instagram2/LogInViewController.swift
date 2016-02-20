//
//  LogInViewController.swift
//  Instagram2
//
//  Created by Carlos Avogadro on 2/16/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController {

    @IBAction func onSignUp(sender: AnyObject) {
        
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
            
            if success{
            print("Created a user")
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            
            }
            else{
            print(error?.localizedDescription)
                if error?.code == 202{
                print("User already exists")
                
                }
            
            }
        }
        
        
        
    }
    @IBAction func onSignIn(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(usernameField.text!, password:passwordField.text!) { (user: PFUser?, error: NSError?) -> Void in
            
            if user != nil{
            
            print("You are logged in")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
            
        }
        
        
    }
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

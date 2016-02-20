//
//  ProfileViewController.swift
//  Instagram2
//
//  Created by Carlos Avogadro on 2/20/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.hidden=true
       // nameLabel.text = PFUser.currentUser() as! String

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func onLogout(sender: AnyObject) {
    
        PFUser.logOut()
        
        
        NSNotificationCenter.defaultCenter().postNotificationName("userDidLogout", object: nil)
    
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

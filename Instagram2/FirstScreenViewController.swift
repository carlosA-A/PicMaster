//
//  FirstScreenViewController.swift
//  Instagram2
//
//  Created by Carlos Avogadro on 2/19/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse


var window: UIWindow?


var storyboard = UIStoryboard(name: "Main", bundle: nil)

var user: User?

class FirstScreenViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var currentUser = PFUser.currentUser()
    
    var posts : [PFObject]!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        var query = PFQuery(className:"UserPhoto")
         query.whereKey("identifier", equalTo:"post")
        
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if let media = media {
                
                self.posts = media
                self.tableView.reloadData()
                //print(self.feed!)
                // do something with the data fetched
            } else {
                // handle error
            }
            
        }
        
        
        tableView.reloadData()
        
        
        

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts {
            
            return self.posts!.count
            
        } else {
            return 0
        }
    
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("InstagramCell", forIndexPath:  indexPath) as! InstagramTableViewCell
        let post = self.posts![indexPath.row]
        
        let postPicture = post["imageFile"] as! PFFile
        let caption = post["caption"] as! String
        let title = post["title"] as! String
        
        cell.titleLable.text = title
        cell.captionLabel.text = caption
        postPicture.getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                if let imageData = imageData {
                    let image = UIImage(data:imageData)
                    cell.postImageView.image = image
                }
            }
            
        }
        
        
        
        
        
        
        
        return cell
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

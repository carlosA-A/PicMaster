//
//  InstagramTableViewCell.swift
//  Instagram2
//
//  Created by Carlos Avogadro on 2/20/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class InstagramTableViewCell: UITableViewCell {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    
    var query = PFQuery(className:"UserPhoto")
    
    
    
    
    
    
    /*var posts : [PFObject]! {
        
        
        
        didSet {
            
            
           
            query.whereKey("identifier", equalTo:"post")
            
            let posts2 = query.findObjects() as? NSArray
            
            
            
            query.findObjectsInBackgroundWithBlock {
                
                (objects: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    print("Successfully retrieved \(objects!.count) scores.")
                    // Do something with the found objects
                    if let objects = objects {
                        for object in objects {
                            print(object.objectId)
                        }
                    }
                } else {
                    // Log details of the failure
                    print("Error: \(error!) \(error!.userInfo)")
                }
            }

            
            
    
            post.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        let image = UIImage(data:imageData)
                        
                        
                    }
                }
            }
            
        
        
        }
    }*/
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

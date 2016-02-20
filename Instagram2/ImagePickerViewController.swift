//
//  ImagePickerViewController.swift
//  Instagram2
//
//  Created by Carlos Avogadro on 2/20/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse



class ImagePickerViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    
    let vc = UIImagePickerController()
   
    
    
    @IBOutlet weak var titleTextInput: UITextField!
    @IBOutlet weak var selesctImageButton: UIButton!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var pictureImageViewer: UIImageView!

    @IBOutlet weak var captionTextInput: UITextField!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        vc.delegate = self
        vc.allowsEditing = true
        
        
        
        pictureImageViewer.hidden = true
    
        captionTextInput.hidden = true
        postButton.hidden = true
        postButton.hidden = true
        titleTextInput.hidden = true

        // Do any additional setup after loading the view.
    }

    @IBAction func onLoadPicker(sender: AnyObject) {
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPost(sender: AnyObject) {
        
        
       // var instagramPost = PFObject(className:"InstagramPost")
        
        
        
        
        /*instagramPost.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("Saved info")
            } else {
                // There was a problem, check error.description
                
                print("Error")
            }
        }*/
        let imageData = UIImagePNGRepresentation(pictureImageViewer.image!)
       
        let imageFile = PFFile(name:"\((titleTextInput.text)!).png", data:imageData!)
        
        var userPhoto = PFObject(className:"UserPhoto")
        userPhoto["identifier"] = "post"
        userPhoto["imageFile"] = imageFile
        userPhoto["caption"] = captionTextInput.text
        userPhoto["title"] = (titleTextInput.text)!

        userPhoto.saveInBackgroundWithBlock{
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("Saved info")
            } else {
                // There was a problem, check error.description
                
                print("Error")
            }
        }
        postButton.hidden = true
        selesctImageButton.hidden = false
        captionTextInput.text?.removeAll()
        titleTextInput.text?.removeAll()
        
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
          let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            //leaves image picking screen and transitions back to ImagePicker ViewController
            vc.dismissViewControllerAnimated(true) { () -> Void in
                //sets imageView to chosen picture
                self.pictureImageViewer.image = originalImage
                
                self.pictureImageViewer.hidden = false
            
                self.captionTextInput.hidden = false
                self.selesctImageButton.hidden = true
                self.postButton.hidden = false
                self.titleTextInput.hidden = false
            
                
            }
            
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

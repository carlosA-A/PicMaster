//
//  UserMedia.swift
//  Instagram2
//
//  Created by Carlos Avogadro on 2/20/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class UserMedia: NSObject {
    
    
    var caption: String?
    
    init(dictionary : NSDictionary) {
        caption = dictionary["caption"] as? String
        
        
        
    }
    
    
    
}

//
//  Keys.swift
//  SecretKeys
//
//  Created by Brennan Stehling on 12/18/15.
//  Copyright © 2015 SecretKeys. All rights reserved.
//

import UIKit

class Keys: NSObject {
    
    static let _sharedInstance = Keys()
    
    private var _keys : [String : AnyObject]?
    
    static func sharedInstance() -> Keys {
        return Keys._sharedInstance
    }
    
    var keys : [String : AnyObject]? {
        get {
            if _keys != nil {
                return _keys
            }
            if let path = NSBundle.mainBundle().pathForResource("Keys", ofType: "plist"),
                let dictionary = NSDictionary(contentsOfFile: path) as? [String : AnyObject] {
                    _keys = dictionary
                    return dictionary
            }
            
            return nil
        }
    }
    
    var greeting : String? {
        return stringForKey("Greeting")
    }
    
    var secretCode : String? {
        return stringForKey("SecretCode")
    }
    
    var secretToken : String? {
        return stringForKey("SecretToken")
    }
    
    private func stringForKey(key : String) -> String? {
        if let keys = self.keys,
            let greeting = keys[key] as? String {
                return greeting
        }
        
        return nil
    }

}

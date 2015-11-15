//
//  Asset.swift
//  InCaseBeta
//
//  Created by Javid Beykzadeh on 11/10/15.
//  Copyright © 2015 JavidCode. All rights reserved.
//

import UIKit

class Asset: NSObject, NSCoding {
    // MARK: Properties
    
    var name: String
    var desc: String
    var photo: UIImage?
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("assets")

    

    
// MARK: Types

struct PropertyKey {
    static let nameKey = "name"
    static let descKey = "desc"
    static let photoKey = "photo"
    }
// MARK: Initialization

init?(name: String, desc: String, photo: UIImage?) {
    // Initialize stored properties.
    self.name = name
    self.desc = desc
    self.photo = photo
    
    super.init()
    
    // Initialization should fail if there is no name or if description is empty.
    if name.isEmpty || desc.isEmpty {
        return nil
        }
    }
// MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(desc, forKey: PropertyKey.descKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
       
    }
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let desc = aDecoder.decodeObjectForKey(PropertyKey.descKey) as!String
        
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        // Must call designated initilizer.
        self.init(name: name, desc: desc, photo: photo)
    }
}









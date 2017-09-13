//
//  Perro.swift
//  tableview_cells
//
//  Created by Ariel Ramírez on 12/09/17.
//  Copyright © 2017 Ariel Ramírez. All rights reserved.
//
import Foundation
import UIKit

//MARK: Objects
class Perro {
    var name: String
    var photo: UIImage
    init (name: String, photo: UIImage) {
        self.name = name
        self.photo = photo
    }
    func returnImage () -> UIImage {
        return self.photo
    }
    func returnName () -> String {
        return self.name
    }
    
    //MARK: userDefaultsObject
    init(coder aDecoder: NSCoder!) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.photo = UIImage(data: (aDecoder.decodeObject(forKey: "photo") as! NSData) as Data)!
    }
    
    func initWhitCoder(aDecoder: NSCoder) -> Perro {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.photo = UIImage(data: (aDecoder.decodeObject(forKey: "photo") as! NSData) as Data)!
        return self
    }
    
    func encodeWhitCoder(aCoder: NSCoder!) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(name, forKey: "photo")
    }
}

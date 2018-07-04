//
//  Pathway.swift
//  Pathways
//
//  Created by Jake Trimble on 11/13/17.
//  Copyright © 2017 SBHS CSA. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Pathway{
    
    //Member fields
    let name:String
    var director:OGContact
    let mission:String
    var logo:UIImage
    let courses:[String]
    let website:URL?
    let instagram:String?
    
    //Main init
    init(name:String,director:OGContact,mission:String,logo:UIImage,courses:[String],website:URL?,instagram:String?) {
        self.name = name
        self.courses = courses
        self.director = director
        self.logo = logo
        self.mission = mission
        self.website = website
        self.instagram = instagram
    }
    
    //Init from dict
    init(src:Dictionary<String,Any>){
        self.name = src["name"] as! String
        self.mission = src["mission"] as! String
        self.website = src["website"] as! String != "*" ? URL(fileURLWithPath: src["website"] as! String) : nil
        self.instagram = src["instagram"] as? String
        self.courses = src["courses"] as! [String]
		
		self.logo = #imageLiteral(resourceName: "OliveAndGoldLOGO")
        
        //Pull director data from firebase in dict staff (Uncomment directorKey)
		self.director = OGContact()
		grabStaff(key: src["director"] as! String)
    }
	
	func grabStaff(key:String){
		let fbRef = FIRDatabase.database().reference()
		let staffRef = fbRef.child("specialPrograms/staff")
		
		staffRef.observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            let staffDict = snapshot.value as? [String : AnyObject] ?? [:]
			
            let srcData = staffDict[key]
			
			let contactImg = #imageLiteral(resourceName: "unknown")
			
            self.director = OGContact(face: contactImg, name: srcData!["name"]! as! String, email: srcData!["email"]! as! String, ext: srcData!["extension"]! as! String, title: srcData!["jobTitle"]! as? String, department: srcData!["department"]! as! String)
		})
	}
}

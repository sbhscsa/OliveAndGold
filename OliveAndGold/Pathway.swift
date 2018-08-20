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
    let dir_img_name:String
    let mission:String
    var logo:UIImage
    let logo_name:String
    let courses:[String]
    let website:String?
    let instagram:String?
    
    //Main init
    init(name:String,director:OGContact,dir_img_name:String,mission:String,logo:UIImage,logo_name:String,courses:[String],website:String?,instagram:String?) {
        self.name = name
        self.courses = courses
        self.director = director
        self.dir_img_name = dir_img_name
        self.logo = logo
        self.logo_name = logo_name
        self.mission = mission
        self.website = website
        self.instagram = instagram
    }
    
    //Init from dict
    init(src:Dictionary<String,Any>){
        self.name = src["name"] as! String
        self.mission = src["mission"] as! String
        self.website = (src["website"] as! String) 
        self.instagram = src["instagram"] as? String
        self.courses = src["courses"] as! [String]
		
        self.logo = UIImage(named: "defaultLogo")!
        self.logo_name = src["logo"] as! String
        self.dir_img_name = src["director"] as! String
        
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
			
			let contactImg = UIImage(named: "unknown")
			
            self.director = OGContact(face: contactImg, name: srcData!["name"]! as! String, email: srcData!["email"]! as! String, ext: srcData!["extension"]! as! String, title: srcData!["jobTitle"]! as? String, department: srcData!["department"]! as! String)
		})
	}
}

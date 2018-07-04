//
//  OGContact.swift
//  Pathways
//
//  Created by Jake Trimble on 11/13/17.
//  Copyright © 2017 SBHS CSA. All rights reserved.
//

import Foundation
import UIKit

//Staff member contact for the Olive&Gold App
class OGContact{
    
    //Member fields
    var face:UIImage?
    let name:String
    let email:String
    let title:String?
    let department:String
	let phoneExtension:String
    
    //Main initializer
	init(face:UIImage?,name:String,email:String,ext:String,title:String?,department:String){
        self.face = face
        self.name = name
        self.email = email
        self.department = department
        self.title = title
		self.phoneExtension = ext
    }
	
	init(){
		self.face = #imageLiteral(resourceName: "unknown")
		self.name = "?"
		self.email = "?@?.?"
		self.department = "?"
		self.title = "Head of ?"
		self.phoneExtension = "???"
	}
}

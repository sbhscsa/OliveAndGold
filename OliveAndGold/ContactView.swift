//
//  ContactView.swift
//  Pathways
//
//  Created by Jake Trimble on 11/13/17.
//  Copyright © 2017 SBHS CSA. All rights reserved.
//

import UIKit

class ContactView: UIView {

    //Member fields
    var contact:OGContact?
    var face:UIImageView!
    var name:UILabel!
    var email:UILabel!
	
    //Appeasing Swift 
    required init?(coder aDecoder: NSCoder) {
		face = UIImageView()
		name = UILabel()
		email = UILabel()
		
		super.init(coder: aDecoder)
	}
    
    //Organize view items
    override func layoutSubviews() {
		print("Layout Contact View")
		
		let temCont = contact ?? OGContact(face: #imageLiteral(resourceName: "unknown"), name: "Wait", email: "xxxx", ext: "000", title: "Lalala", department: "Nope")

        //Frame for face view
        face.frame = CGRect(x: 5, y: 5, width: Double(self.frame.width/5), height: Double(self.frame.height-10))

        //Frames for text views
        name.frame = CGRect(x: Double(face.frame.width + 10), y: 5, width: Double(self.frame.width-face.frame.width-15), height: Double((self.frame.height-10)/2))
		
		email.frame = CGRect(x: name.frame.minX, y: CGFloat(name.frame.height + 10), width: name.frame.width, height: name.frame.height)

		
        face.image = temCont.face ?? #imageLiteral(resourceName: "unknown")
		name.text = temCont.name
		email.text = temCont.email
		
		self.addSubview(face)
		self.addSubview(name)
		self.addSubview(email)
    }
	
	func setContact(contact: OGContact){
		self.contact = contact
		
		layoutSubviews()
	}

}

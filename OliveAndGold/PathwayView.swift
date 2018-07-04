//
//  PathwayView.swift
//  Pathways
//
//  Created by Jake Trimble on 11/13/17.
//  Copyright © 2017 SBHS CSA. All rights reserved.
//

import UIKit

class PathwayView: UIViewController {
    
    //Pathway to display
    var pathway:Pathway!
    
    //View items
	@IBOutlet weak var nomeLabel: UILabel!
	@IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var statement: UILabel!
	@IBOutlet weak var directorView: ContactView!
	@IBOutlet weak var courseList: UILabel!
    @IBOutlet weak var contactInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//Get pathway info from Pathway var and copy to view
		nomeLabel.text = pathway.name
		logo.image = pathway.logo
		statement.text = "The mission of the \(pathway.name) Pathway is to \(pathway.mission)."
		
		//Course list setup
		courseList.numberOfLines = pathway.courses.count
		var temStr = ""
		for course in pathway.courses{
			temStr += "- \(course)\n"
		}
		courseList.text = temStr
		print(temStr)
		
		//Instagram/Website setup
		var coStr = ""
		
		coStr += pathway.website != nil ? "Website: \(pathway.website!)\n" : ""
		coStr += pathway.instagram != nil ? "Instagram: \(pathway.instagram!)" : ""
		
		contactInfo.text = coStr
		courseList.sizeToFit()
		
		directorView.setContact(contact: pathway.director)
		directorView.layoutSubviews()
    }
	
	override func viewDidLayoutSubviews() {
	}
	

    


}

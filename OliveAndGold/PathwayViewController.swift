//
//  PathwayView.swift
//  Pathways
//
//  Created by Jake Trimble on 11/13/17.
//  Copyright © 2017 SBHS CSA. All rights reserved.
//

import UIKit

class PathwayViewController: UIViewController {
    
    //Pathway to display
    var pathway:Pathway!
    
    //View items
//    @IBOutlet weak var nomeLabel: UILabel!
	@IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var statement: UILabel!
	@IBOutlet weak var directorView: ContactView!
	@IBOutlet weak var courseList: UILabel!
    @IBOutlet weak var contactInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//Get pathway info from Pathway var and copy to view
		self.navigationItem.title = pathway.name
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
		
		coStr += pathway.website != nil ? "Website: " + pathway.website! + "\n" : ""
		coStr += pathway.instagram != nil ? "Instagram: \(pathway.instagram!)" : ""
		
		contactInfo.text = coStr
        // Without this, the link within the text was white against a white background. Go figure...
        // Also, go check out the ContactInfo label on the PathwayView Scene in the main storyboard
        // and notice that Link is checked in the Data Detectors section, so tapping on the link in
        // the label will open up Safari from the app.
        contactInfo.tintColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
		courseList.sizeToFit()
		
		directorView.setContact(contact: pathway.director)
		directorView.layoutSubviews()
    }
	
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
	}

}

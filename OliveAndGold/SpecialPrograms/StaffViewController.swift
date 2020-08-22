//
//  ViewController.swift
//  OliveAndGoldDirectors
//
//  Created by Kristiana Budke on 1/7/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit

class StaffViewController: UIViewController {

    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var StaffScrollView: UIScrollView!
    
    var mainStruct: ProgStruct!
    
    var directorName: String!
    var directorEmail: String!
    let viewHeight: CGFloat = 180
    let viewWidth: CGFloat = 150
    var staffBackgroundColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
    var nameColor : UIColor! = UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1)
    var backgroundColor : UIColor! = UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1)
    
    var staffArray: [SPStaffMember]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        directorName = mainStruct.director.name
        directorEmail = mainStruct.director.email
        
        
        let nameLabel : UILabel = UILabel()
        let emailLabel : UILabel = UILabel()
        
        staffArray = mainStruct.SPStaffMembers
            //[SPStaffMember(imageName: "johnston.jpg",name:"Bob" ,title: "teacher" ,email:"bob@gmail.com"), SPStaffMember(imageName: "johnston.jpg",name:"Nancy" ,title: "teacher" ,email:"nancy@gmail.com"), SPStaffMember(imageName: "johnston.jpg",name:"Natalie" ,title: "teacher" ,email:"nancy@gmail.com"), SPStaffMember(imageName: "johnston.jpg",name:"Paul" ,title: "teacher" ,email:"nancy@gmail.com"), SPStaffMember(imageName: "johnston.jpg",name:"Tom" ,title: "teacher" ,email:"nancy@gmail.com")]
        
        // Director Info view
        infoView.backgroundColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
        infoView.clipsToBounds = true
        infoView.layer.cornerRadius = 8.0
        
        // Direcctor Image view
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        imageView.layer.borderWidth = 2.0
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1).cgColor
        imageView.image = UIImage(named: mainStruct.director.imageName)
        
        // Director Name
        nameLabel.text = directorName
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.sizeToFit()
        nameLabel.frame.origin = CGPoint(x: infoView.bounds.midX-nameLabel.bounds.width/2, y: 10)
        
        // Director Email
        emailLabel.text = directorEmail
        emailLabel.textColor = UIColor.white
        emailLabel.font = UIFont.systemFont(ofSize: 16)
        emailLabel.sizeToFit()
        emailLabel.frame.origin = CGPoint(x: infoView.bounds.midX-emailLabel.bounds.width/2, y: infoView.bounds.height-(emailLabel.bounds.height + 10))
        
        StaffScrollView.delegate = self as? UIScrollViewDelegate
        StaffScrollView.contentSize.height = self.viewHeight
        StaffScrollView.contentSize.width = CGFloat(staffArray.count) * self.viewWidth
        
        for (index, SPStaffMember) in staffArray.enumerated() {
            let staffView : UIView! = UIView()
            let staffNameLabel = UILabel()
            let staffImageView = UIImageView()
            let staffJobTitle = UILabel()
            let staffEmailLabel = UILabel()
            
            // View:
            staffView.frame = CGRect(x: CGFloat(index) * self.viewWidth, y: StaffScrollView.bounds.midY-StaffScrollView.bounds.height/2, width: self.viewWidth, height: self.viewHeight)
            staffView.backgroundColor = staffBackgroundColor
            staffView.layer.borderColor = backgroundColor.cgColor
            staffView.layer.borderWidth = 2
            staffView.layer.cornerRadius = 8
            staffView.clipsToBounds = true
            
            
            // Image:
            staffImageView.image = UIImage(named: SPStaffMember.imageName)
            staffImageView.frame.size = CGSize(width: 100, height: 100)
            staffImageView.frame.origin = CGPoint(x: CGFloat(viewWidth / 2) - (staffImageView.frame.width / 2), y: 10)
            staffImageView.layer.borderColor = backgroundColor.cgColor
            staffImageView.layer.borderWidth = 2
            staffImageView.layer.cornerRadius = 12
            staffImageView.clipsToBounds = true
            staffImageView.contentMode = .scaleAspectFill
            
            
            // Name:
            staffNameLabel.textColor = nameColor
            staffNameLabel.text = SPStaffMember.name
            staffNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
            staffNameLabel.sizeToFit()
            staffNameLabel.frame.origin = CGPoint(x: CGFloat(viewWidth / 2) - (staffNameLabel.bounds.width / 2), y: staffImageView.bounds.height + 15)
            
            // Job Title:
            staffJobTitle.text = SPStaffMember.title
            staffJobTitle.font = UIFont(name: "Arial", size: 12)
            staffJobTitle.textColor = nameColor
            staffJobTitle.sizeToFit()
            staffJobTitle.frame.origin = CGPoint(x: CGFloat(viewWidth / 2) - (staffJobTitle.bounds.width / 2), y: staffImageView.bounds.height + staffNameLabel.bounds.height + 15)
            
            // Email label
            //Job Title:
            staffEmailLabel.text = SPStaffMember.email
            staffEmailLabel.font = UIFont(name: "Arial", size: 12)
            staffEmailLabel.textColor = nameColor
            staffEmailLabel.sizeToFit()
            staffEmailLabel.frame.origin = CGPoint(x: CGFloat(viewWidth / 2) - (staffEmailLabel.bounds.width / 2), y: staffImageView.bounds.height + staffNameLabel.bounds.height + staffJobTitle.bounds.height + 15)
            
            staffView.addSubview(staffImageView)
            staffView.addSubview(staffNameLabel)
            staffView.addSubview(staffJobTitle)
            staffView.addSubview(staffEmailLabel)
            
            StaffScrollView.addSubview(staffView)
        }
        
        // Add subviews
        infoView.addSubview(nameLabel)
        infoView.addSubview(emailLabel)
    }
}


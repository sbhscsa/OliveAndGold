//
//  ViewController.swift
//  OliveAndGoldDirectors
//
//  Created by Kristiana Budke on 1/7/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit
import Firebase

class StaffViewController: UIViewController {

    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var StaffScrollView: UIScrollView!
    @IBOutlet weak var staffMembersLabel: UILabel!
    
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
        
        self.directorName = mainStruct.director.name
        self.directorEmail = mainStruct.director.email
        
        
        let nameLabel : UILabel = UILabel()
        let emailLabel : UILabel = UILabel()
        
        self.staffArray = mainStruct.SPStaffMembers
        //*** NOTE: Firebase won't store empty arrays, and CodableFirebase couldn't handle
        // decoding the SPStaffMembers array of the ProgStruct if it was empty.
        // So the Pathways/Academies without any staff beyond the director have an array
        // with a single entry with all fields filled in with "unk" to get around the above problems.
        if self.staffArray.count == 1 && self.staffArray[0].name == "unk" {
            self.staffArray = []
        }
        
        // Director Info view
        self.infoView.backgroundColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
        self.infoView.clipsToBounds = true
        self.infoView.layer.cornerRadius = 8.0
        
        // Direcctor Image view
        self.imageView.clipsToBounds = true
        self.imageView.layer.cornerRadius = 8.0
        self.imageView.layer.borderWidth = 2.0
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.layer.borderColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1).cgColor
//        self.imageView.image = UIImage(named: mainStruct.director.imageName)
        self.getStaffImageFromFirebase(self.imageView, name: mainStruct.director.imageName)
        
        // Director Name
        nameLabel.text = self.directorName
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.sizeToFit()
        nameLabel.frame.origin = CGPoint(x: infoView.bounds.midX-nameLabel.bounds.width/2, y: 10)
        
        // Director Email
        emailLabel.text = self.directorEmail
        emailLabel.textColor = UIColor.white
        emailLabel.font = UIFont.systemFont(ofSize: 16)
        emailLabel.sizeToFit()
        emailLabel.frame.origin = CGPoint(x: infoView.bounds.midX-emailLabel.bounds.width/2, y: infoView.bounds.height-(emailLabel.bounds.height + 10))
        
        self.StaffScrollView.delegate = self as? UIScrollViewDelegate
        self.StaffScrollView.contentSize.height = 180 //self.viewHeight
        self.StaffScrollView.contentSize.width = CGFloat(self.staffArray.count) * self.viewWidth
        
        // Hide the label if there are no other staff besides the director
        if self.staffArray.count == 0 {
            self.staffMembersLabel.isHidden = true
        }
        for (index, SPStaffMember) in self.staffArray.enumerated() {
            let staffView : UIView! = UIView()
            let staffNameLabel = UILabel()
            let staffImageView = UIImageView()
            let staffJobTitle = UILabel()
            let staffEmailLabel = UILabel()
            
            // View:
            staffView.frame = CGRect(x: CGFloat(index) * self.viewWidth, y: StaffScrollView.bounds.midY-StaffScrollView.bounds.height/2, width: self.viewWidth, height: self.viewHeight)
            staffView.backgroundColor = self.staffBackgroundColor
            staffView.layer.borderColor = self.backgroundColor.cgColor
            staffView.layer.borderWidth = 2
            staffView.layer.cornerRadius = 8
            staffView.clipsToBounds = true
            
            
            // Image:
//            staffImageView.image = UIImage(named: SPStaffMember.imageName)
            self.getStaffImageFromFirebase(staffImageView, name: SPStaffMember.imageName)
            staffImageView.frame.size = CGSize(width: 100, height: 100)
            staffImageView.frame.origin = CGPoint(x: CGFloat(viewWidth / 2) - (staffImageView.frame.width / 2), y: 10)
            staffImageView.layer.borderColor = self.backgroundColor.cgColor
            staffImageView.layer.borderWidth = 2
            staffImageView.layer.cornerRadius = 12
            staffImageView.clipsToBounds = true
            staffImageView.contentMode = .scaleAspectFill
            
            
            // Name:
            staffNameLabel.textColor = self.nameColor
            staffNameLabel.text = SPStaffMember.name
            staffNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
            staffNameLabel.sizeToFit()
            staffNameLabel.frame.origin = CGPoint(x: CGFloat(viewWidth / 2) - (staffNameLabel.bounds.width / 2), y: staffImageView.bounds.height + 15)
            
            // Job Title:
            staffJobTitle.text = SPStaffMember.title
            staffJobTitle.font = UIFont(name: "Arial", size: 12)
            staffJobTitle.textColor = self.nameColor
            staffJobTitle.sizeToFit()
            staffJobTitle.frame.origin = CGPoint(x: CGFloat(viewWidth / 2) - (staffJobTitle.bounds.width / 2), y: staffImageView.bounds.height + staffNameLabel.bounds.height + 15)
            
            // Email label
            //Job Title:
            staffEmailLabel.text = SPStaffMember.email
            staffEmailLabel.font = UIFont(name: "Arial", size: 12)
            staffEmailLabel.textColor = self.nameColor
            staffEmailLabel.sizeToFit()
            staffEmailLabel.frame.origin = CGPoint(x: CGFloat(viewWidth / 2) - (staffEmailLabel.bounds.width / 2), y: staffImageView.bounds.height + staffNameLabel.bounds.height + staffJobTitle.bounds.height + 15)
            
            staffView.addSubview(staffImageView)
            staffView.addSubview(staffNameLabel)
            staffView.addSubview(staffJobTitle)
            staffView.addSubview(staffEmailLabel)
            
            self.StaffScrollView.addSubview(staffView)
        }
        
        // Add subviews
        self.infoView.addSubview(nameLabel)
        self.infoView.addSubview(emailLabel)
    }
    
    func getStaffImageFromFirebase(_ imgV:UIImageView, name imgName: String) {
        let fbStorage = FIRStorage.storage()
        let picRef = fbStorage.reference(forURL: "gs://oliveandgold-8b692.appspot.com/images/staff/specialPrograms/" + imgName + ".png")
        picRef.data(withMaxSize: 1 * 1024 * 1024, completion: {
            (data, error) in
            
            if error != nil {
                print("Image download error: " + (error?.localizedDescription)!)
                // If there is no image for this person, use the placeholder image
                imgV.image = UIImage(named: "unknown.png")
            }
            else {
                imgV.image = UIImage(data: data!) ?? UIImage(named: "unknown.png")
            }
        })
    }
}


//
//  Counselors.swift
//  OliveAndGold-Updated
//
//  Created by Robert Weisz on 1/20/17.
//  Copyright © 2016 . All rights reserved.
//

import Foundation
import UIKit
import Firebase

/*
 - Add new staff members here, you can remove the validate function, however it makes sure that the person you created is valid/working. (Spaced for clarity)
 
 - The staff VC automatically updates the view so all you need to do is add a new staff member by calling and filling in the parameters with CreateStaffMember!
 
 - When adding a new staff member, the order in which the function is called is *VITAL* to the order inwhich you see it on the screen. That being said, if you want to make it so it automatically updates the ordering - alphabetically as requested by Mr Barr - then feel free to do that!
 */

class AdminStaff{
    private var staffList:[StaffMember] = []
    private var fbRef: FIRDatabaseReference!
    
    // Parent Table View Controller
    private var parentTableVC: AdminVC!
    
    init(parent: AdminVC) {
        self.parentTableVC = parent
        // create a staff member in for-loop (CreateStaffMember)
        fbRef = FIRDatabase.database().reference()
        
        // get reference to {"admin": { "staff" : {}}}
        let staffRef = self.fbRef.child("admin/staff")
        var imageNames = [String]()
        
        staffRef.observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            // Initial data grab should be [String : AnyObject] - drill down after that
            // It's really [String: [String : String]], except for the 'education' key (see below)
            let staffDictionaries = snapshot.value as? [String : AnyObject] ?? [:]
            for staffMemberName in staffDictionaries.keys {
                let staffData = staffDictionaries[staffMemberName]
                let name = staffData?["name"] as! String
                let email = staffData?["email"] as! String
                let title = staffData?["title"] as! String
                // This one is an array of strings (but could be empty!)
                let education: [String] = staffDictionaries[staffMemberName]!["education"] as? [String] ?? []
                let image = staffData?["image"] as! String
                imageNames.append(image)
                let ext = staffData?["ext"] as! Int
                let imageToUse = UIImage(named: "unknown.png")
                
                self.CreateStaffMember(name: name, email: email, title: title, education: education, image: imageToUse!, img_name: image, ext: "\(ext)")
            }
            // Nesting a call to get images (in the above loop) from the FB Storage causes problems.
            // Breaking the database/storage calls up in the following manner seems to work out:
            self.getImages(imgNames: imageNames)
            self.parentTableVC.setupUI()
        })
    }
    
    func getImages(imgNames: [String]) {
        // For the image:
        // get a reference to the firebase storage DB
        let fbStorage = FIRStorage.storage()
        // Note: you can't get a Storage directory listing (to iterate contents) but you could do something clever
        //       like list files / file groups in the realtime db...
        for imgName in imgNames {
            let picRef = fbStorage.reference(forURL: "gs://oliveandgold-8b692.appspot.com/images/staff/admin/" + imgName + ".png")
            picRef.data(withMaxSize: 1 * 1024 * 1024, completion: {
                (data, error) in
                
                if error != nil {
                    print("Image download error: " + (error?.localizedDescription)!)
                    // If there is no image for this person, use the placeholder image
                }
                else {
                    let imageToUse = UIImage(data: data!)
                    // set the image in the list
                    for item in self.staffList {
                        // contains() is bridged from NSString
                        if item.GetImageName() == imgName {
                            item.SetImage(image: imageToUse!)
                            self.parentTableVC.setStaffViewImageFromScrollView(imgName: imgName)
                        }
                    }
                }
            })
        }
    }
    
    func CreateStaffMember(name: String, email: String, title: String!, education: [String],image: UIImage, img_name: String!, ext: String!){
        staffList.append(StaffMember(name: name, email: email, title: title, desc: education, image: image, imgName: img_name, phoneExtension: ext))
    }
    
    //Retreives the staff member by their name
    func GetStaffMember(name: String) -> StaffMember                                                                                                                                {
        for staffMember in staffList {
            if staffMember.GetName() == name || staffMember.GetName().contains(name) {
                return staffMember
            }
        }
        return (nil as StaffMember?)!
    }
    
    func GetStaffList() -> [StaffMember] {
        // Put them in order by extension; that puts the Principal first, AP for Seniors second, etc!
        return staffList.sorted(by: {$0.GetPhoneExtension() < $1.GetPhoneExtension()})
    }
}

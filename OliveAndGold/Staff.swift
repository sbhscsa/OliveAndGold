//
//  Counselors.swift
//  OliveAndGold-Updated
//
//  Created by Trip Creighton on 10/26/16.
//  Copyright © 2016 Trip Creighton. All rights reserved.
//

import Foundation
import UIKit
import Firebase

/*
 - Add new staff members here, you can remove the validate function, however it makes sure that the person you created is valid/working. (Spaced for clarity)
 
 - The staff VC automatically updates the view so all you need to do is add a new staff member by calling and filling in the parameters with CreateStaffMember!
 
 - When adding a new staff member, the order inwhich the function is called is *VITAL* to the order inwhich you see it on the screen. That being said, if you want to make it so it automatically updates the ordering - alphabetically as requested by Mr Barr - then feel free to do that!
 */

class Staff{
    private var staffList:[StaffMember] = []
    
    private var fbRef: FIRDatabaseReference!
    
    // Parent Table View Controller
    private var parentTableVC: MainVC!
    
    init(parent: MainVC) {
        self.parentTableVC = parent
        setUpStaff()
    }
    
    func setUpStaff()
    {
        //create a staff member in for-loop (CreteStaffMember)
        fbRef = FIRDatabase.database().reference()
        
        // get reference to {"CCC": { "linksections" : {}}}
        let staffRef = self.fbRef.child("CCC/staff")
        
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
                let education: [String] = staffDictionaries[staffMemberName]!["description"] as? [String] ?? []
                let image = staffData?["image"] as! String
                let ext = staffData?["ext"] as! Int
                
                // If there is no image for this person, use the placeholder image
                let imageToUse = UIImage(named: image) ?? UIImage(named: "unknown")
                self.CreateStaffMember(name: name, email: email, title: title, education: education, image: imageToUse!, ext: "\(ext)")
                
            }
            // once this completes, call load the scroll view
            self.parentTableVC.setupUI()
        })
    }
    
    
    //You can copy paste this! -> CreateStaffMember(name: "NAMEHERE", email: "EMAILHERE", education: ["DESCRIPTION HERE!"], image: UIImage(named: "IMAGENAME"), ext: "1234")
    func CreateStaffMember(name: String, email: String, title: String!, education: [String], image: UIImage, ext: String!){
        staffList.append(StaffMember(name: name, email: email, title: title, desc: education, image: image, phoneExtension: ext))
    }
    
    //Retreives the staff member by their name
    func GetStaffMember(name: String) -> StaffMember                                                                                                                                {
        for staffMember in staffList {
            if staffMember.GetName() == name || staffMember.GetName().contains(name) {
                return staffMember
            }
        }
        return nil as StaffMember!
    }
    
    func GetStaffList() -> [StaffMember] {
        return staffList
    }
}

//
//  Counselors.swift
//  OliveAndGold-Updated
//
//  Created by Robert Weisz on 1/20/17.
//  Copyright © 2016 . All rights reserved.
//

import Foundation
import UIKit

/*
 - Add new staff members here, you can remove the validate function, however it makes sure that the person you created is valid/working. (Spaced for clarity)
 
 - The staff VC automatically updates the view so all you need to do is add a new staff member by calling and filling in the parameters with CreateStaffMember!
 
 - When adding a new staff member, the order inwhich the function is called is *VITAL* to the order inwhich you see it on the screen. That being said, if you want to make it so it automatically updates the ordering - alphabetically as requested by Mr Barr - then feel free to do that!
 */

class AdminStaff{
    private var staffList:[StaffMember] = []
    
    init() {
        
 
        
       /*        ADMINISTRATION        */
    
        CreateStaffMember(name: "Dr. John Becchio", email: "jbecchio@sbunified.org",title: "Principal", education: ["Ed.D. Educational Leadership and Administration, General" ,  "M.A. Educational Leadership and Administration, General", "Single Subject Teaching Credential, Secondary Education and Teaching", "B.S. Kinesiology and Exercise Science", "Minor, Spanish" ], image: UIImage(named: "becchio")!, ext: "5001")

        CreateStaffMember(name: "Tiffany Carson", email: "tcarson@sbunified.org", title: "Assistant Principal 12th Grade", education: ["Bachelor of Music Performance, Ithaca College", "Education Specialist, Cal State University Channel Islands", "Preliminary Administrative Services Credential, Santa Barbara County Education Office"], image: UIImage(named: "carson")!, ext: "5002")
        
        CreateStaffMember(name: "Fred Razo", email: "frazo@sbunified.org", title: "Assistant Principal 9th & 10th Grade", education: ["B.S. Social Science Criminal Justice, Cal Poly San Luis Obispo", "M.S. Counseling Marriage Family Therapy, Cal Poly San Luis Obispo", "Educational Administrative Services Credential, Cal Poly San Luis Obispo"], image: UIImage(named: "razo")!, ext: "5004")
        
        CreateStaffMember(name: "Matthew Stockton", email: "mstockton@sbunified.org", title: "Assistant Principal 11th Grade", education: ["B.A. English, California State University, Long Beach", "Master of Education, University of La Verne", "Administrative Services Credential","Single Subject Teaching Credential, English and Social Science"], image: UIImage(named: "stockton")!, ext: "5003")
        
        CreateStaffMember(name: "Mario Rodriguez", email: "mariorodriguez@sbunified.org", title: "Dean of Student Engagement", education: ["B.S. Mechanical Engineering, UC Irvine", "M.Ed. Teaching, University of Hawai'i", "Preliminary Administrative Services Credential","California Teaching Credentials: Physics, Math"], image: UIImage(named: "rodriguez")!, ext: "5005")
    
    }
    
    
    //You can copy paste this! -> CreateStaffMember(name: "NAMEHERE", email: "EMAILHERE", education: ["DESCRIPTION HERE!"], image: UIImage(named: "IMAGENAME"), ext: "1234")
    func CreateStaffMember(name: String, email: String, title: String!, education: [String],image: UIImage, ext: String!){
        staffList.append(StaffMember(name: name, email: email, title: title, desc: education ,image: image, phoneExtension: ext))
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

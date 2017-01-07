//
//  Counselors.swift
//  OliveAndGold-Updated
//
//  Created by Trip Creighton on 10/26/16.
//  Copyright © 2016 Trip Creighton. All rights reserved.
//

import Foundation
import UIKit

/*
 - Add new staff members here, you can remove the validate function, however it makes sure that the person you created is valid/working. (Spaced for clarity)
 
 - The staff VC automatically updates the view so all you need to do is add a new staff member by calling and filling in the parameters with CreateStaffMember!
 
 - When adding a new staff member, the order inwhich the function is called is *VITAL* to the order inwhich you see it on the screen. That being said, if you want to make it so it automatically updates the ordering - alphabetically as requested by Mr Barr - then feel free to do that!
 */

class Staff{
    private var staffList:[StaffMember] = []
    
    init() {
        
        /*        COUNSELORS        */

        //Adams
        CreateStaffMember(name: "Alicia Adams", email: "aadams@sbunified.org", title: "Guidance Counselor, Man-P", education: ["B.A. Communications", "M.S. Counseling and Guidance", "Multiple Subject Teaching Credential"], image: UIImage(named: "adams")!, ext: "5138")
        
        //Cortes
        CreateStaffMember(name: "Edith Cortes", email: "ecortes@sbunified.org", title: "PEAC Counselor", education: ["B.S. Sociology", "M.S. Educational Counseling", "Pupil Personnel Services Credential"], image: UIImage(named: "cortes")!, ext: "5133")
        
        //Kerstiens
        CreateStaffMember(name: "Kara Kerstiens", email: "kkersteins@sbunified.org", title: "Guidance Counselor, Qu-Sam", education: ["B.A. Psychology", "M.S. Counseling and Guidance", "California Lutheran University"], image: UIImage(named: "kerstiens")!, ext: "5135")
        
        //Porter
        CreateStaffMember(name: "Marcy Porter", email: "mporter@sbunified.org", title: "Guidance Counselor, A-Co", education: ["B.A. Psychology", "M.A. Educational Counseling", "Pupil Personnel Services Credential"], image: UIImage(named: "porter")!, ext: "5136")
        
        //Acevedo
        CreateStaffMember(name: "Martha Acevedo", email: "macevedo@sbunified.org", title: "Guidance Counselor, Gui-Mal", education: ["M.A. Educational Counseling"], image: UIImage(named: "acevedo")!, ext: "5139")

        //Gil
        CreateStaffMember(name: "Ruben Gil", email: "rgil@sbunified.org", title: "Guidance Counselor, Cr-Gue", education: ["M.A. Educational Counseling", "California State University Northridge"], image: UIImage(named: "gil")!, ext: "5137")
        
        //Barr
        CreateStaffMember(name: "Spencer Barr", email: "sbarr@sbunified.org", title: "College & Career Counselor", education: ["B.A. History", "B.A. Art History", "M.S. Educational Counseling", "Pupil Personnel Services Credential", "College Admissions Specialist"], image: UIImage(named: "barr")!, ext: "5036")

        //Snyder
        CreateStaffMember(name: "Susan Snyder", email: "ssnyder@sbunified.org", title: "Guidance Counselor, San-Z", education: [ "B.A. Biology", "Single Subject Teaching Credential", "Certificate College Counseling", "Certificate Advanced Spanish", "M.A. Educational Counseling", "Pupil Personnel Services Credential"], image: UIImage(named: "snyder")!, ext: "5134")
        
        /*        SUPPORT STAFF        */
        
        //Rodenas
        CreateStaffMember(name: "Sarinna Rodenas", email: "srrodenas@sbunified.org", title: "Counseling Secretary", education: [""], image: UIImage(named: "rodenas")!, ext: "5132")
        
        //Forslund
        CreateStaffMember(name: "Jeannine Forslund", email: "forslund@sbunified.org", title: "Coordinator, Bridges Program", education: ["B.A. Art History", "M.A. Art History", "Multiple Subject Teaching Credential", "Special Education Teaching Credential"], image: UIImage(named: "forslund")!, ext: "5039")
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

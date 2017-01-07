//
//  StaffMember.swift
//  OliveAndGold-Updated
//
//  Created by Trip Creighton on 10/26/16.
//  Copyright © 2016 Trip Creighton. All rights reserved.
//

import UIKit
import Foundation

class StaffMember{
    private var Name:String!, Email:String!, Description:[String]! = [], Image:UIImage!, Extension:String!, jobTitle:String!
    init(name: String, email: String, title: String!, desc: [String], image: UIImage!, phoneExtension: String!){
        if name == "" || email == "" || !email.contains("@") || phoneExtension == "" || title == ""{
            return
        }
        Name = name
        Email = email
        Description = desc
        Image = image
        Extension = phoneExtension
        jobTitle = title
    }
    
    func GetName() -> String {
        return Name
    }
    
    func GetEmail() -> String {
        return Email
    }
    
    func GetJobTitle() -> String {
        return jobTitle
    }
    
    func GetDescription() -> [String] {
        return Description
    }
    
    func GetPhoneExtension() -> String {
        return Extension
    }
    
    func GetPhoneNumber() -> String {
        return "8059669101,\(Extension!)"
    }
    
    func GetPhoneFormatted() -> String {
        return "(805)-966-9101, \(Extension!)"
    }
    
    func GetImage() -> UIImage! {
        return Image
    }
    
    func toString() -> String {
        return "Name: " + GetName() + " | Email: " + GetEmail()
    }
}

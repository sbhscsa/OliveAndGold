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
    private var Name:String!, Email:String!, Description:[String]! = [], Image:UIImage!, Extension:String!, jobTitle:String!, ImgName:String!
    init(name: String, email: String, title: String!, desc: [String], image: UIImage!, imgName: String!, phoneExtension: String!){
        if name == "" || email == "" || !email.contains("@") || phoneExtension == "" || title == ""{
            return
        }
        self.Name = name
        self.Email = email
        self.Description = desc
        self.Image = image
        self.ImgName = imgName
        self.Extension = phoneExtension
        self.jobTitle = title
    }
    
    func GetName() -> String {
        return self.Name
    }
    
    func GetEmail() -> String {
        return self.Email
    }
    
    func GetJobTitle() -> String {
        return self.jobTitle
    }
    
    func GetDescription() -> [String] {
        return self.Description
    }
    
    func GetPhoneExtension() -> String {
        return self.Extension
    }
    
    func GetPhoneNumber() -> String {
        return "8059669101,\(self.Extension!)"
    }
    
    func GetPhoneFormatted() -> String {
        return "(805)-966-9101, \(self.Extension!)"
    }
    
    func GetImage() -> UIImage! {
        return self.Image
    }
    
    func GetImageName() -> String! {
        return self.ImgName
    }
    
    func SetImage(image: UIImage) {
        self.Image = image
    }
    
    func toString() -> String {
        return "Name: " + self.GetName() + " | Email: " + self.GetEmail()
    }
}

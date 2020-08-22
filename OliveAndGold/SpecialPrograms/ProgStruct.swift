//
//  CellData.swift
//  OliveGoldMasterView
//
//  Created by Nathan on 1/6/20.
//  Copyright © 2020 NateLabs. All rights reserved.
//

import Foundation

struct ProgStruct {
    var programName = ""
    var expandedName = ""
    var type = "Default"
    var logo = "SBHSLogo"
    var bigLogo = "SBHSLogo"
    var background = "SBHSBack"
    
    var statement = ""
    var socialMediaLinks = SocialMedia()
    
    var director = SPStaffMember()
    var SPStaffMembers = [SPStaffMember]()
    
    var courses = [String]()
    
    var miscInfo = Pathway()
    
    
//    init(name: String ?? "fill", expName: String, type: String, logo: String, background: String) {
//        self.name = name
//        self.expName = expName
//        self.type = type
//        self.logo = logo
//        self.background = background
//    }
   
}

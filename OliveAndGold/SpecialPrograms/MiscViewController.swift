//
//  ViewController.swift
//  Quotes-App
//
//  Created by mobile on 1/6/20.
//  Copyright © 2020 mobile. All rights reserved.
//

import UIKit

class MiscViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var mainStruct: ProgStruct!
    
    var FieldTrips:String = ""
    var Pathways:String = ""
    var StudentWork:String = ""
    var DonationLink:String = ""
    // This is the specific Pathway that this VC is currently handling
    var pathwayName = ""

    // This is the array of all Pathways
    var specialPrograms = [Pathway]()
    
    @IBOutlet weak var MainContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        for x in specialPrograms{
            if pathwayName == x.name {
                FieldTrips = x.fieldTrips
                Pathways = x.pathways
                StudentWork = x.studentWork
                DonationLink = x.donationLink
                break
            }
        }
        MainContent.text = mainStruct.miscInfo.fieldTrips
    }
    
    @IBAction func controlTab(_ sender: Any) {
        // Either use a dictionary in line 19
        //      then get the Pathway (value) using the pathwayName (key)
        // Or loop over specialPrograms until pathwayName matches the
        //      particular program name; then use that programs other data
        
// MAYBE WE WANT "COURSES","PATHWAYS","SOCIAL MEDIA","EXTRA (e.g. Field Trips)"
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            MainContent.text = mainStruct.miscInfo.fieldTrips
        case 1:
            MainContent.text = mainStruct.miscInfo.pathways
        case 2:
            MainContent.text = mainStruct.miscInfo.studentWork
        default:
            break
        }
    }
    
    @IBAction func link(_ sender: UIButton) {
        if let url = URL(string: mainStruct.miscInfo.donationLink) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    

}



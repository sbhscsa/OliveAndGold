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
    @IBOutlet weak var donateButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackNameLabel: UILabel!
    
    var mainStruct: ProgStruct!
    
    var features:String = ""
    var courses:String = ""
    var socialMedia:String = ""
    var DonationLink:String = ""
    // This is the specific Pathway that this VC is currently handling
    var pathwayName = ""

    // This is the array of all Pathways
    var specialPrograms = [Pathway]()
    
    @IBOutlet weak var MainContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.donateButton.layer.cornerRadius = 10.0
        
        self.stackView.isHidden = true
        self.MainContent.isHidden = false
        // JSONDecoder won't decode unicode character points so in our JSON we use
        // the placeholder '$ITEM' and do a string replace with our unicode symbol.
        self.MainContent.text = mainStruct.miscInfo.features.replacingOccurrences(of: "$ITEM", with: "\u{29BF}")
        self.stackNameLabel.text = mainStruct.expandedName
    }
    
    @IBAction func controlTab(_ sender: Any) {
        // Either use a dictionary in line 19
        //      then get the Pathway (value) using the pathwayName (key)
        // Or loop over specialPrograms until pathwayName matches the
        //      particular program name; then use that programs other data
        
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            self.stackView.isHidden = true
            self.MainContent.isHidden = false
            // JSONDecoder won't decode unicode character points so in our JSON we use
            // the placeholder '$ITEM' and do a string replace with our unicode symbol.
            MainContent.text = mainStruct.miscInfo.features.replacingOccurrences(of: "$ITEM", with: "\u{29BF}")
        case 1:
            self.stackView.isHidden = true
            self.MainContent.isHidden = false
            MainContent.text = mainStruct.miscInfo.courses.replacingOccurrences(of: "$ITEM", with: "\u{29BF}")
        case 2:
            self.stackView.isHidden = false
            self.MainContent.isHidden = true
            self.socialMedia = mainStruct.miscInfo.socialMedia
        default:
            break
        }
    }
    
    /*
     Facebook appears to have changing schemes for opening the app. Maybe just
     open a web page for facebook links. https://www.facebook.com/SBHSComputerScienceAcademy/
     */
    @IBAction func instaTapped(_ sender: UIButton) {
        let instaFb = self.socialMedia.components(separatedBy: ",")
        let insta = instaFb[0].components(separatedBy: ":")
        let appURL = URL(string:  "instagram://user?username=\(insta[1])")!
        let webURL = URL(string:  "https://instagram.com/\(insta[1])")!
        
        if UIApplication.shared.canOpenURL(appURL) {
            // try to open the instagram app, if the user has it installed
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            // redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func fbTapped(_ sender: UIButton) {
        let instaFb = self.socialMedia.components(separatedBy: ",")
        let fB = instaFb[1].components(separatedBy: ":")
        let webURL = URL(string:  "https://www.facebook.com/\(fB[1])")!
        UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
    }
    
    @IBAction func link(_ sender: UIButton) {
        if let url = URL(string: mainStruct.miscInfo.donationLink) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    

}



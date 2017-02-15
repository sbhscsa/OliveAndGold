//
//  StaffVC.swift
//  OliveAndGold-Updated
//
//  Created by Trip Creighton on 10/28/16.
//  Copyright © 2016 . All rights reserved.
//

import UIKit
import MessageUI

class AdminStaffDisplayVC: UIViewController, MFMailComposeViewControllerDelegate {
    //Storyboard outlets

    @IBOutlet var nameLabel: UILabel!,
                  emailLabel: UILabel!,
                  phoneLabel: UILabel!,
                  imageView: UIImageView!,
                  credentialsLabel: UILabel!
    
    
    //Fields which are assigned in the function setupUI
    private var centerX:CGFloat!,
                centerY:CGFloat!,
                viewWidth:CGFloat!,
                viewHeight:CGFloat!
    
    //Staff member which a class will be passed in from the main view controllers prepare func
    var staffMember:StaffMember!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        print("[DBG] Setting up the UI!")
        //Fields
        centerX = view.center.x
        centerY = view.center.y
        viewWidth = view.frame.width
        viewHeight = view.frame.height
        
        //backgroundcolor
        
        
        //Picture:
        imageView.image = staffMember.GetImage()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        imageView.layer.borderWidth = 2.0
        imageView.contentMode = .scaleAspectFit
        
        //color edited***
        imageView.layer.borderColor = UIColor(red: 155/255, green: 142/255, blue: 41/255, alpha: 1).cgColor
        
        //Labels:
        nameLabel.text = staffMember.GetName()
        nameLabel.sizeToFit()
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textColor = UIColor(red: 210/255, green: 178/255, blue: 76/255, alpha: 1)
        
        emailLabel.text = staffMember.GetEmail()
        emailLabel.sizeToFit()
        emailLabel.adjustsFontSizeToFitWidth = true
        emailLabel.textColor = UIColor(red: 210/255, green: 178/255, blue: 76/255, alpha: 1)
        phoneLabel.text = staffMember.GetPhoneFormatted()
        phoneLabel.sizeToFit()
        phoneLabel.adjustsFontSizeToFitWidth = true
        phoneLabel.textColor = UIColor(red: 210/255, green: 178/255, blue: 76/255, alpha: 1)

        
        
        //Description: Adds the education, only if it exists
        if staffMember.GetDescription()[0] != "" {
            for (index, staffMemberDesc) in staffMember.GetDescription().enumerated() {
                let curStaffDesc:UILabel! = UILabel(frame: CGRect(x: credentialsLabel.frame.origin.x + 3, y: (credentialsLabel.frame.origin.y + 12) + CGFloat(index * 40), width: view.frame.width-20, height: 100))
                curStaffDesc.text = " - \(staffMemberDesc)"
                
                //color edited**
                curStaffDesc.textColor = UIColor(red: 210/255, green: 178/255, blue: 76/255, alpha: 1)
                curStaffDesc.font = UIFont(name: "HelveticaNeue", size: 16.5)
                curStaffDesc.lineBreakMode = .byWordWrapping
                curStaffDesc.numberOfLines = 5
                credentialsLabel.textColor = UIColor(red: 210/255, green: 178/255, blue: 76/255, alpha: 1)
                view.addSubview(curStaffDesc)
            }
        } else {
            print("[DBG] No credentials for", staffMember.GetName())
            credentialsLabel.isHidden = true
        }
    }
    
    
    @IBAction func emailButton(_ sender: UIButton) {
        print("[DBG] Pressed email button!")
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients([staffMember.GetEmail()])
        mailComposerVC.setSubject("Hello \(staffMember.GetName())")
        mailComposerVC.setMessageBody("<br><br>Sent from <font color='darkgreen'>Olive</font>And<font color='BAA156'>Gold</font>", isHTML: true)
        
        if !MFMailComposeViewController.canSendMail() {
            print("[DBG] Failed to initalize the mail view!")
            return
        }
        self.present(mailComposerVC, animated: true)
    }
    
    @IBAction func callButton(_ sender: UIButton) {
        if let phone = NSURL(string: "tel://\(staffMember.GetPhoneNumber())") {
            print("[DBG] Calling \(staffMember.GetName()) was successful!")
             UIApplication.shared.openURL(phone as URL)
        } else {
            let alert:UIAlertController = UIAlertController(title: "Error!", message: "Failed to make call due to unknown error!", preferredStyle: .alert)
            print("[DBG] Failed to call \(staffMember.GetPhoneNumber())")
            self.show(alert, sender: self)
        }

    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        print("[DBG] Dismissing the mailVC with result:", result)
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        print("[DBG] Sending user back to phone!")
        self.dismiss(animated: true, completion: nil)
    }

}

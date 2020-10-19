//
//  TableOneViewController.swift
//  OliveAndGold
//  Created by Evan Heffernan on 4/12/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import UIKit
import MessageUI

class MainVC: UITableViewController, MFMailComposeViewControllerDelegate {
   
    /*  
    
        Green color is UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1)
        Gold is UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
     */
    
    //Questions & staff fields
    private var questions:Questions!,
                staff:Staff!,
                segueStaffMember:StaffMember!
    
    //Property Constants
    private let viewHeight:Int! = 180,
                viewWidth:Int! = 150,
    
    //color edited**
        //staffBackgroundColor:UIColor! = UIColor(red: 79/255, green: 97/255, blue: 71/255, alpha: 1),
    staffBackgroundColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1),
    nameColor:UIColor! = UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1),
    backgroundColor:UIColor! = UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1)
        

    
    //Storyboard outlets
    @IBOutlet var scrollView: UIScrollView!
    
    // This is needed because viewDidLoad is TOO LATE for setting 
    // the tab bar image and title
    // And we implement this version of init() because 
    // it is the designated initializer of the superclass (UITableViewController) to this class 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarItem.image = UIImage(named: "cccTabIcon")
        self.tabBarItem.title = "CCC"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
        nav?.barTintColor = UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1)
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"Back", style: .plain, target:nil, action:nil)
        
        scrollView.delegate = self
        scrollView.contentSize.height = 134
        self.view.backgroundColor = backgroundColor
        
        // Do this here to give AppDelegate's application:didFinishLaunchingWithOptions
        // a chance to finish (Firebase configuration) before we access Firebase
        
        // both of these classes get a reference to self so they can call appropriate setup methods
        // once the data has finished loading over the network (which takes in indeterminate amount of time)
        questions = Questions(parent: self)
        staff = Staff(parent: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Initalizes everything we need to initalize on the UI
    func setupUI(){
        // Do this here because the staff have now loaded from firebase
        scrollView.contentSize.width = CGFloat(((staff.GetStaffList().count) * viewWidth))
        
        //Add a view for each new staff member
        for (index, staffMember) in staff.GetStaffList().enumerated() {
            let staffView:UIView! = UIView(),
                staffNameLabel:UILabel! = UILabel(),
                staffImageView:UIImageView! = UIImageView(),
                staffJobTitle:UILabel! = UILabel()

            //View:
            staffView.frame.size = CGSize(width: viewWidth, height: viewHeight)
            staffView.backgroundColor = staffBackgroundColor
            staffView.frame.origin = CGPoint(x: (index * viewWidth), y: Int(scrollView.center.y - staffView.center.y))
            staffView.layer.borderColor = backgroundColor.cgColor
            staffView.layer.borderWidth = 2
            staffView.layer.cornerRadius = 8
            staffView.clipsToBounds = true
            
            //Gesture recognizer for each staff member
            let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(staffPressed))
            staffView.isUserInteractionEnabled = true
            staffView.addGestureRecognizer(tapGesture)
            staffView.tag = index
            
            //Image:
            staffImageView.image = staffMember.GetImage()
            staffImageView.frame.size = CGSize(width: 100, height: 130)
            staffImageView.frame.origin = CGPoint(x: CGFloat(viewWidth / 2) - (staffImageView.frame.width / 2), y: 10)
            staffImageView.layer.borderColor = backgroundColor.cgColor
            staffImageView.layer.borderWidth = 2
            staffImageView.layer.cornerRadius = 12
            staffImageView.clipsToBounds = true
            staffImageView.contentMode = .scaleAspectFit
            

            //Name:
            staffNameLabel.textColor = nameColor
            staffNameLabel.text = staffMember.GetName()
            staffNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
            staffNameLabel.sizeToFit()
            staffNameLabel.frame.origin = CGPoint(x: CGFloat(viewWidth / 2) - (staffNameLabel.bounds.width / 2), y: staffImageView.bounds.height + 10)

            //Job Title:
            staffJobTitle.text = staffMember.GetJobTitle()
            staffJobTitle.font = UIFont(name: "Arial", size: 9)
            staffJobTitle.textColor = nameColor
            staffJobTitle.sizeToFit()
            staffJobTitle.frame.origin = CGPoint(x: CGFloat(viewWidth / 2) - (staffJobTitle.bounds.width / 2), y: staffView.bounds.height - (staffJobTitle.bounds.height * 2))
            
            staffView.addSubview(staffImageView)
            staffView.addSubview(staffNameLabel)
            staffView.addSubview(staffJobTitle)
            
            scrollView.addSubview(staffView)
        }
    }
    
    func setStaffViewImageFromScrollView(imgName: String) {
        for (index, staffMember) in staff.GetStaffList().enumerated() {
            if staffMember.GetImageName() == imgName {
                let staffSubViews = scrollView.subviews[index].subviews
                for subview in staffSubViews {
                    if let staffImageView = subview as? UIImageView {
                        staffImageView.image = staffMember.GetImage()
                        staffImageView.frame.size = CGSize(width: 100, height: 130)
                        staffImageView.frame.origin = CGPoint(x: CGFloat(viewWidth / 2) - (staffImageView.frame.width / 2), y: 10)
                        staffImageView.layer.borderColor = backgroundColor.cgColor
                        staffImageView.layer.borderWidth = 2
                        staffImageView.layer.cornerRadius = 12
                        staffImageView.clipsToBounds = true
                        staffImageView.contentMode = .scaleAspectFit
                        // don't need to call setNeedsDisplay() on the subview or staffImageView
                        // because apparently it knows to do that from the mods above...
                        return
                    }
                }
            }
        }
    }
    
    // This is needed because the tableview will load faster than data will arrive from Firebase
    // So in the Questions class, we call this method after the data is done loading (via a reference
    // to this class that we pass in when creating the Questions object, above in viewDidLoad
    func reloadTableData() {
        self.tableView.reloadData()
    }
    
    @objc func staffPressed(sender: UITapGestureRecognizer) {
        print("[DBG] Going to", staff.GetStaffList()[(sender.view?.tag)!].GetName())
        segueStaffMember = staff.GetStaffList()[(sender.view?.tag)!]
        self.performSegue(withIdentifier: "StaffDisplayVC", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("[DBG] Going to", segue.identifier ?? "ERROR! No identifier!")
        if segue.identifier == "QuestionVC"{
            let questionVC = segue.destination as! QuestionVC
            let selectedCell = sender as! MainTableViewCell
            questionVC.questionDictonary = questions.getSection(byName: (selectedCell.sectionLabel.text)!)
        } else if segue.identifier == "StaffDisplayVC" {
            let staffDisplayVC = segue.destination as! StaffDisplayVC
            staffDisplayVC.staffMember = segueStaffMember
        }
    }
    
    // MARK: table view methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.getSectionList().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionRow", for: indexPath as IndexPath) as! MainTableViewCell
        cell.sectionLabel.text = questions.getSectionNames()[indexPath.row]
        return cell
    }
    
    // MARK: mail composer
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result{
        case MFMailComposeResult.cancelled:
            print("[DBG] Mail Cancelled!")
        case MFMailComposeResult.saved:
            print("[DBG] Result Saved!")
        case MFMailComposeResult.sent:
            print("[DBG] Result Sent!")
        case MFMailComposeResult.failed:
            print("[DBG] Mail sent failure:", error?.localizedDescription ?? "ERROR! No description for mail state!")
        @unknown default:
            print("unknown mail error")
        }
        self.dismiss(animated: true, completion: nil)
    }

}

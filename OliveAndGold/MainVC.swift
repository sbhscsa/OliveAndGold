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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do this here to give AppDelegate's application:didFinishLaunchingWithOptions
        // a chance to finish (Firebase configuration) before we access Firebase
        questions = Questions(parent: self)
        staff = Staff()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Initalizes everything we need to initalize on the UI
    func setupUI(){
        navigationController?.navigationBar.tintColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"Back", style: .plain, target:nil, action:nil)

        scrollView.delegate = self
        scrollView.contentSize.height = 134
        scrollView.contentSize.width = CGFloat(((staff.GetStaffList().count) * viewWidth))
        view.backgroundColor = backgroundColor
        
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
    
    /* OVERRIDES & BUILT-IN FUNCS */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.getSectionList().count
    }
    
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
        }
        self.dismiss(animated: true, completion: nil)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionRow", for: indexPath as IndexPath) as! MainTableViewCell
        cell.sectionLabel.text = questions.getSectionNames()[indexPath.row]
        return cell
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

}

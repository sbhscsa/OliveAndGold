//
//  AdminVC.swift
//  OliveAndGold
//
//  Created by Aaron Peyton on 1/20/17.
//  Copyright © 2017 com.4myeecc. All rights reserved.
//

import UIKit
import MessageUI


class AdminVC: UITableViewController, MFMailComposeViewControllerDelegate {

    /*
    Green color is UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1)
    Gold is UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
    */
    
    //Questions & staff fields
    private var staff:AdminStaff!,
                segueStaffMember:StaffMember!
    
    //Property Constants
    private let viewHeight:Int! = 180,
                viewWidth:Int! = 150,
    
    //color edited**
    //staffBackgroundColor:UIColor! = UIColor(red: 79/255, green: 97/255, blue: 71/255, alpha: 1),
    staffBackgroundColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1),
    nameColor:UIColor! = UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1),
    backgroundColor:UIColor! = UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1)
    
    // list of URLs for table cells
    private var urls = [ URL(string: "https://1.cdn.edl.io/Yn4kb8cxoCPBrORlThSo16BsIItoPMZxk4SFA7Jupyn4ukSL.pdf")!, //school profile
                         URL(string: "http://sbhs.sbunified.org/apps/video/watch.jsp?v=131522")!,] //promo video 
                        //admin org chart added in viewDidLoad
    
    private let cellNames = [ "Principals's Message", "School Profile", "Promotional Video", "Admin Org Chart"]
                        // need one for loading url filepath for org chart
    
    //Storyboard outlets
    @IBOutlet weak var AdminScrollView: UIScrollView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarItem.image = UIImage(named: "adminTabIcon")
        self.tabBarItem.title = "Admin"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pmPdf = Bundle.main.url(forResource: "PrincipalsMessage", withExtension: "pdf", subdirectory: nil, localization: nil)
        let orgPdf = Bundle.main.url(forResource: "SBHSOrgChart", withExtension: "pdf", subdirectory: nil, localization: nil)
        
        if pmPdf != nil {
            urls.insert(pmPdf!, at: 0)
        } else {
            print("\n\n\n couldn't find principal's message PDF, didnt load it into urls\n\n\n")
        }
        
        if orgPdf != nil{
            urls.append(orgPdf!)
        } else{
            print("\n\n\n couldn't find Org PDF, didnt load it into urls\n\n\n")
        }
        
        staff = AdminStaff()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Initalizes everything we need to initalize on the UI
    func setupUI(){
        navigationController?.navigationBar.tintColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"Back", style: .plain, target:nil, action:nil)
        
        AdminScrollView.delegate = self
        AdminScrollView.contentSize.height = 134
        AdminScrollView.contentSize.width = CGFloat(((staff.GetStaffList().count) * viewWidth))
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
            staffView.frame.origin = CGPoint(x: (index * viewWidth), y: Int(AdminScrollView.center.y - staffView.center.y))
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
            
            AdminScrollView.addSubview(staffView)
        }
    }
    
    
    @objc func staffPressed(sender: UITapGestureRecognizer) {
        print("[DBG] Going to", staff.GetStaffList()[(sender.view?.tag)!].GetName())
        segueStaffMember = staff.GetStaffList()[(sender.view?.tag)!]
        self.performSegue(withIdentifier: "AdminStaffDisplayVC", sender: self)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "AdminStaffDisplayVC" {
            let adminStaffDisplayVC = segue.destination as! AdminStaffDisplayVC
            adminStaffDisplayVC.staffMember = segueStaffMember
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if cellNames[indexPath.row] == "Promotional Video" {
            let webVideoVC = AdminVideoWebViewController()
            self.navigationController?.pushViewController(webVideoVC, animated: true)
        } else {
            let webVC = storyboard?.instantiateViewController(withIdentifier: "AdminWebviewVC") as! AdminWebViewController
            webVC.url = urls[indexPath.row]
            self.navigationController?.pushViewController(webVC, animated: true)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return urls.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "adminCell", for: indexPath) as! AdminTableViewCell
        
//        let url = urls[indexPath.row]
        cell.rowLabel.text = cellNames[indexPath.row]

        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


}

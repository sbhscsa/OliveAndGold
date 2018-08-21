//
//  AdminVC.swift
//  OliveAndGold
//
//  Created by Aaron Peyton on 1/20/17.
//  Copyright © 2017 com.4myeecc. All rights reserved.
//

import UIKit
import MessageUI
import Firebase

class AdminVC: UITableViewController, MFMailComposeViewControllerDelegate {

    /*
    Green color is UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1)
    Gold is UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
    */
    
    private var fbRef: FIRDatabaseReference!
    
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
    //private var urls = [String]() //promo video
    private var cellNames = ["Principals's Message":"", "Admin Org Chart":"", "School Profile":"", "Promotional Video":""]

    
    //Storyboard outlets
    @IBOutlet weak var AdminScrollView: UIScrollView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarItem.image = UIImage(named: "adminTabIcon")
        self.tabBarItem.title = "Admin"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get links
        fbRef = FIRDatabase.database().reference()
        
        // get reference to {"CCC": { "linksections" : {}}}
        let staffRef = self.fbRef.child("admin/links")
        
        staffRef.observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            let linksDictionaries = snapshot.value as? [String : String] ?? [:]
            for linkKey in linksDictionaries.keys {
                let link = linksDictionaries[linkKey]! as String
                if linkKey == "message" {
                    self.cellNames["Principals's Message"] = link
                } else if linkKey == "orgchart" {
                    self.cellNames["Admin Org Chart"] = link
                } else if linkKey == "profile" {
                    self.cellNames["School Profile"] = link
                } else { // linkKey == "promo"
                    self.cellNames["Promotional Video"] = link
                }
            }
            self.tableView.reloadData()
        })
        
        staff = AdminStaff(parent: self)
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
    
    func setStaffViewImageFromScrollView(imgName: String) {
        for (index, staffMember) in staff.GetStaffList().enumerated() {
            if staffMember.GetImageName() == imgName {
                let staffSubViews = AdminScrollView.subviews[index].subviews
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
        // check cell contents in same order as they were displayed
        let visibleStrings = self.cellNames.keys.sorted()
        if visibleStrings[indexPath.row] == "Promotional Video" {
            let webVideoVC = AdminVideoWebViewController()
            self.navigationController?.pushViewController(webVideoVC, animated: true)
        } else {
            let webVC = storyboard?.instantiateViewController(withIdentifier: "AdminWebviewVC") as! AdminWebViewController
            let fileURLStr = self.cellNames[visibleStrings[indexPath.row]]!
            if fileURLStr.starts(with: "gs") { // we're gonna load a (pdf) file from Firebase Storage
                
                if let fileURL = URL(string: fileURLStr) {
                    // document folder url
                    let documentsUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                    // destination file url
                    let destination = documentsUrl.appendingPathComponent(fileURL.lastPathComponent)
                    print("local path to file: " + destination.path)
                    // check if it exists before downloading
// TODO: WHAT IF IT'S STALE?
// A: FileManager has methods such as attributesOfItem(atPath:) where attributes are things like modification date, size, etc.
//    so we could download (regardless of whether it's already present) every N days/weeks/months/years and compare the
//    downloaded file to the local one, and replace the local one if it's stale.
                    if FileManager().fileExists(atPath: destination.path) {
                        print("The file already exists at path")
                        webVC.isData = true
                        webVC.url = destination
                        self.navigationController?.pushViewController(webVC, animated: true)
                    } else { // gotta get it from Firebase first
                        //  if the file doesn't exist get data from Firebase
                        let fbStorage = FIRStorage.storage()
                        let fileRef = fbStorage.reference(forURL: fileURLStr)
                        fileRef.data(withMaxSize: 1 * 1024 * 1024, completion: {
                            (data, error) in
                            
                            if error != nil {
                                print("File download error: " + (error?.localizedDescription)!)
                            }
                            else {
                                // store the data
                                print("downloading and storing " + fileURLStr)
                                let result = FileManager.default.createFile(atPath: destination.path, contents: data, attributes: nil)
                                if result {
                                    webVC.isData = true
                                    webVC.url = destination
                                    self.navigationController?.pushViewController(webVC, animated: true)
                                } else {
                                    print("error creating file at: " + destination.path)
                                }
                            }
                        })
                    }
                }
            } else { // not a PDF; load an actual web page
                webVC.url = URL(string: fileURLStr)
                self.navigationController?.pushViewController(webVC, animated: true)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cellNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "adminCell", for: indexPath) as! AdminTableViewCell
        
        // display the cell contents in alphabetical order
        let visibleStrings = self.cellNames.keys.sorted()
        cell.rowLabel.text = visibleStrings[indexPath.row]
        
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

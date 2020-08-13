//
//  TableViewController.swift
//  OliveAndGold
//
//  Created by Mobile on 1/13/17.
//  Copyright © 2017 com.4myeecc. All rights reserved.
//

import UIKit
import Firebase

class SPTableViewController: UITableViewController {
    
    var programs:[Pathway] = []
    var logoNames:[String] = []
    var directorNames:[String] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarItem.image = UIImage(named: "specialTabIcon")
        self.tabBarItem.title = "Special Programs"
        loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }

    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! SPTableViewCell
        
        cell.setData(programs[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pvc = storyboard?.instantiateViewController(withIdentifier: "PathwayVC") as! PathwayViewController
        let selectedCell = tableView.cellForRow(at: indexPath) as! SPTableViewCell
        pvc.pathway = selectedCell.data
        self.navigationController?.pushViewController(pvc, animated: true)
    }
    
    func setup(){
        let  nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
        nav?.barTintColor = UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1)
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"Back", style: .plain, target:nil, action:nil)
    }
    
    func loadData(){
		let fbRef = FIRDatabase.database().reference()
		let pathwaysRef = fbRef.child("specialPrograms/programs")
		
		pathwaysRef.observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
			let srcDict = snapshot.value as? [[String : AnyObject]] ?? [[:]]
			
			for dictS in srcDict{
				let thePath = Pathway(src: dictS)
                self.logoNames.append(dictS["logo"] as! String)
                self.directorNames.append(dictS["director"] as! String)
				
				self.programs.append(thePath)
			}
            self.getStaffImages(imgNames: self.directorNames)
            self.getLogoImages(imgNames: self.logoNames)
		})
    }
    
    func getStaffImages(imgNames: [String]) {
        // For the image:
        // get a reference to the firebase storage DB
        let fbStorage = FIRStorage.storage()
        // Note: you can't get a Storage directory listing (to iterate contents) but you could do something clever
        //       like list files / file groups in the realtime db...
        for imgName in imgNames {
            let picRef = fbStorage.reference(forURL: "gs://oliveandgold-8b692.appspot.com/images/staff/specialPrograms/" + imgName + ".png")
            picRef.data(withMaxSize: 1 * 1024 * 1024, completion: {
                (data, error) in
                
                if error != nil {
                    print("Image download error: " + (error?.localizedDescription)!)
                    // If there is no image for this person, use the placeholder image
                }
                else {
                    let imageToUse = UIImage(data: data!)
                    // set the image in the list
                    for item in self.programs {
                        // contains() is bridged from NSString
                        if item.dir_img_name == imgName {
                            item.director.face = imageToUse
                        }
                    }
                }
            })
            self.tableView.reloadData()
        }
    }
    
    func getLogoImages(imgNames: [String]) {
        // For the image:
        // get a reference to the firebase storage DB
        let fbStorage = FIRStorage.storage()
        // Note: you can't get a Storage directory listing (to iterate contents) but you could do something clever
        //       like list files / file groups in the realtime db...
        for imgName in imgNames {
            let picRef = fbStorage.reference(forURL: "gs://oliveandgold-8b692.appspot.com/images/logos/" + imgName + ".png")
            picRef.data(withMaxSize: 1 * 1024 * 1024, completion: {
                (data, error) in
                
                if error != nil {
                    print("Image download error: " + (error?.localizedDescription)!)
                    // If there is no image for this person, use the placeholder image
                }
                else {
                    let imageToUse = UIImage(data: data!)
                    // set the image in the list
                    for item in self.programs {
                        // contains() is bridged from NSString
                        if item.logo_name == imgName {
                            item.logo = imageToUse!
                        }
                    }
                }
            })
            self.tableView.reloadData()
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//// NEED THIS VIEW CONTROLLER ON THE STORYBOARD
//        if segue.identifier == "PathwayView"{
//            let pathviewVC = segue.destination as! PathwayViewController
//            let selectedCell = sender as! SPTableViewCell
//            pathviewVC.pathway = selectedCell.data
//        }
//// GET TO EXISTING WEBVC FROM LINK FROM ABOVE VC (so probably not via a segue???)
//        else if segue.identifier == "WebVC" {
//            print("Would show SP Web VC at this point...")
//            print("Here comes the crash... wait for it!")
//        }
//    }

}

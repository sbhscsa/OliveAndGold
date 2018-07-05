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
    
    func setup(){
        let  nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
        nav?.barTintColor = UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1)
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"Back", style: .plain, target:nil, action:nil)
    }
    
    func loadData(){
		let fbRef = FIRDatabase.database().reference()
		let pathwaysRef = fbRef.child("specialPrograms/programs")
		
		pathwaysRef.observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
			let srcDict = snapshot.value as? [[String : AnyObject]] ?? [[:]]
			
			for dictS in srcDict{
				let thePath = Pathway(src: dictS)
				
				self.programs.append(thePath)
			}
		})
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
// NEED THIS VIEW CONTROLLER ON THE STORYBOARD
        if segue.identifier == "PathwayView"{
            let pathviewVC = segue.destination as! PathwayView
            let selectedCell = sender as! SPTableViewCell
            pathviewVC.pathway = selectedCell.data
        }
// GET TO EXISTING WEBVC FROM LINK FROM ABOVE VC (so probably not via a segue???)
        else if segue.identifier == "WebVC" {
            print("Would show SP Web VC at this point...")
            print("Here comes the crash... wait for it!")
        }
    }

}

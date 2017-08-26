//
//  TableViewController.swift
//  OliveAndGold
//
//  Created by Mobile on 1/13/17.
//  Copyright © 2017 com.4myeecc. All rights reserved.
//

import UIKit

class SPTableViewController: UITableViewController {
    
    let programsDictionary:[String:String] = [
        "Band" : "http://www.sbhsbands.org",
        "Computer Science Academy" : "http://www.sbhscs.org",
        "Dance" : "http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=317351&type=d&pREC_ID=724677",
        "Dons Crew" : "https://docs.google.com/a/sbunified.org/forms/d/e/1FAIpQLScB-uw4H0NrCTI9Wd3WAcQ_v2fvBTL41rGbUkQYZt7w5v-xJg/viewform",
        "MAD Academy" : "http://madacad.com",
        "Sports Medicine" : "http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=314371&type=d&pREC_ID=720537",
        "Theatre" : "http://sbhstheatre.com",
        "VADA Academy" : "https://sites.google.com/a/sbunified.org/vadasbhs/"
    ]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarItem.image = UIImage(named: "specialTabIcon")
        self.tabBarItem.title = "Special Programs"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programsDictionary.count
    }

    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath)
        
        let label = cell.viewWithTag(1) as! UILabel
        
        for (index, key) in programsDictionary.keys.sorted().enumerated() {
            if index == (indexPath as NSIndexPath).row {
                label.text = key
            }
        }
        
        return cell
    }
    
    func setup(){
        let  nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)
        nav?.barTintColor = UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1)
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 155/255, green: 122/255, blue: 41/255, alpha: 1)]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"Back", style: .plain, target:nil, action:nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebVC"{
            let webviewVC = segue.destination as! SPWebVC
            let selectedCell = sender as! SPTableViewCell
            webviewVC.urlToLoad = programsDictionary[selectedCell.specialPLabel.text!]!
        }
    }

}

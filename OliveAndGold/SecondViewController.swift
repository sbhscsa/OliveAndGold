//
//  SecondViewController.swift
//  OliveAndGold
//  Created by Evan Heffernan on 4/12/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {
    
    var cellDictionary : [String:String]!
    var firstTableNum : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 172/255.0, green: 140/255.0, blue: 53/255.0, alpha: 1)

        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDictionary.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondaryCells", for: indexPath)
        let label = cell.viewWithTag(5) as! UILabel
        
        for (index, key) in cellDictionary.keys.sorted().enumerated() {
            if index == indexPath.row {
                label.text = key
                break
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushToThirdWeb"{
            let thirdPage = segue.destination as! ThirdViewWebView
            let cellRow = sender as! UITableViewCell
            thirdPage.holdsCellNumDictionary = CellElements.sharedInstance.newArrays[firstTableNum!]
            thirdPage.secondPageCellNum = tableView.indexPath(for: cellRow)?.row
        }
    }
}

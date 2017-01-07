//
//  SecondViewController.swift
//  OliveAndGold
//  Created by Evan Heffernan on 4/12/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import UIKit

class QuestionVC: UITableViewController {
    
    var questionDictonary:[String:String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 38/255, green: 57/255, blue: 30/255, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionDictonary.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCells", for: indexPath)
        let label = cell.viewWithTag(5) as! UILabel
        
        for (index, key) in questionDictonary.keys.sorted().enumerated() {
            if index == (indexPath as NSIndexPath).row {
                label.text = key
                break
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebviewVC"{
            let webviewVC = segue.destination as! WebviewVC
            let selectedCell = sender as! QuestionTableViewCell
            webviewVC.urlToLoad = questionDictonary[selectedCell.questionLabel.text!]!
        }
    }
}

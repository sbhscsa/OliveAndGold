//
//  Questions.swift
//  OliveAndGold
//
//  Created by Trip Creighton on 12/14/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import Foundation
import Firebase

/* 
    - This is the master class for each of the questions.
    - I have this here because it is more readable and accessable retrieving them from here.
 */

class Questions {
    private var questionList = [[String:String]](),
                sectionList  = [String:[String:String]](),
                sectionNames = [String]()
    
    // FB reference variable
    private var fbRef: FIRDatabaseReference!
    
    // Parent Table View Controller
    private var parentTableVC: MainVC!
    
    init(parent: MainVC) {
        self.parentTableVC = parent
        setupQuestions()
    }
    
    //Feel free to move this to the constructor, however I only do this so the constructor is more readable!
    private func setupQuestions(){
        print("[DBG] Setting up questions & urls")
        
        // get a reference to the firebase realtime database
        fbRef = FIRDatabase.database().reference()
        
        // get reference to {"CCC": { "linksections" : {}}}
        let tabsCCCRef = self.fbRef.child("CCC/linksections")
        print(tabsCCCRef)
        
        // load only ONCE per app startup; this data won't change over long periods of time
        tabsCCCRef.observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            // Initial data grab should be [String : AnyObject] - drill down after that
            let linkSectionsDictionaries = snapshot.value as? [String : AnyObject] ?? [:]
            for sectionName in linkSectionsDictionaries.keys {
                self.sectionNames.append(sectionName)
                let sectionDictionary = linkSectionsDictionaries[sectionName] as! [String:String]
                self.questionList.append(sectionDictionary)
                self.sectionList[sectionName] = sectionDictionary
            }
            // once this completes, reload the main tableview data 
            // (it could've been rendered already and be sitting empty...)
            self.parentTableVC.reloadTableData()
        })
    }
    
    func getSection(byName: String) -> [String:String]? {
        for section in sectionList {
            if section.key == byName || section.key.contains(byName) {
                return section.value
            }
        }
        return nil
    }
    
    
    func getSectionList() -> [String:[String:String]] {
        return sectionList
    }
    
    func getQuestionList() -> [[String:String]] {
        return questionList
    }
    
    func getSectionNames() -> [String] {
        return sectionNames
    }
}

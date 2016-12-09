//
//  ThirdViewWebView.swift
//  OliveAndGold
//  Created by Evan Heffernan on 4/12/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import WebKit

class ThirdViewWebView: UIViewController {
    
    @IBOutlet var webSize: UIWebView!
    
    var holdsCellNumDictionary : [String:String]!
    var secondPageCellNum : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webSize.frame.size = self.view.frame.size
        let webViewController = self.view.viewWithTag(333) as! UIWebView
        var link = ""
//        let arrayOfLinks: [String]
        for (index, key) in holdsCellNumDictionary.keys.sorted().enumerated() {
            if index == secondPageCellNum {
                link = holdsCellNumDictionary[key]!
            }
        }
        
        webViewController.loadRequest(URLRequest(url: URL(string:"\(link)")!))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

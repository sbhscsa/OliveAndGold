//
//  SPWebVC.swift
//  OliveAndGold
//
//  Created by Mobile on 1/17/17.
//  Copyright © 2017 com.4myeecc. All rights reserved.
//

import UIKit

class SPWebVC: UIViewController {

    @IBOutlet var SPWeb: UIWebView!
    
    var urlToLoad:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        SPWeb.frame.size = self.view.frame.size
        print("[DBG] Navigating the webview to '", urlToLoad, "'")
        SPWeb.loadRequest(URLRequest(url: URL(string: urlToLoad)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//
//  ThirdViewWebView.swift
//  OliveAndGold
//  Created by Evan Heffernan on 4/12/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import UIKit

class WebviewVC: UIViewController {
    
    @IBOutlet var webview: UIWebView!
    
    var urlToLoad:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.frame.size = self.view.frame.size
        print("[DBG] Navigating the webview to '", urlToLoad, "'")
        webview.loadRequest(URLRequest(url: URL(string: urlToLoad)!))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

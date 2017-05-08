//
//  AdminWebViewController.swift
//  OliveAndGold
//
//  Created by Mobile on 5/5/17.
//  Copyright © 2017 com.4myeecc. All rights reserved.
//

import UIKit
import WebKit

class AdminWebViewController: UIViewController, WKNavigationDelegate {
    var webView:WKWebView!
    var url:URL?
    
    let dUrl = URL(string: "http://sbhs.sbunified.org")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        webView.navigationDelegate = self
        
        webView.allowsBackForwardNavigationGestures = true
        
        if url == nil{
            url = dUrl
            print("\n\n\n BUHHHHHH URL DID NOT WORK\n\n\n")
        }
        webView.load(URLRequest(url: url!))
        
        view.addSubview(webView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

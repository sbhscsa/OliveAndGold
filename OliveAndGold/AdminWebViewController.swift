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
    var isData:Bool = false
    
    let dUrl = URL(string: "http://sbhs.sbunified.org")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        self.webView.navigationDelegate = self
        
        self.webView.allowsBackForwardNavigationGestures = true
        
        if url == nil{
            url = dUrl
            print("\n\n\n BUHHHHHH URL DID NOT WORK\n\n\n")
        }
        
        if isData {
            let data = try! Data(contentsOf: url!)
            self.webView.load(data, mimeType: "application/pdf", characterEncodingName: "", baseURL: (self.url?.deletingLastPathComponent())!)
        } else {
            self.webView.load(URLRequest(url: url!))
        }
        
        view.addSubview(self.webView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This handles resizing the view - swapping width and height - upon rotation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.webView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
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

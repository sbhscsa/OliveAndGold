//
//  AdminVideoWebViewController.swift
//  OliveAndGold
//
//  Created by room26 admin on 5/10/17.
//  Copyright © 2017 com.4myeecc. All rights reserved.
//

import UIKit
import WebKit

class AdminVideoWebViewController: UIViewController {
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let markup = "<body bgcolor=\"black\"><div style=\"position: relative; top: 50%; transform: translateY(-50%);\"> <div style=\"text-align: center; background-color: black;\"> <iframe class=\"edlio-embed-player\" type=\"text/html\" width=\"640\" height=\"360\" src=\"http://sbhs.sbunified.org/apps/embed/?v=129742\" frameborder=\"0\" allowfullscreen></iframe></div></div></body>"
        
        webView = WKWebView(frame: self.view.frame)
        
        webView.loadHTMLString(markup, baseURL: nil)
        
        self.view.addSubview(webView)
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

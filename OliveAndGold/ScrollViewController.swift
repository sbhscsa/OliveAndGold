//
//  ScrollViewController.swift
//  OliveAndGold
//
//  Created by Mobile on 4/18/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {
    
    @IBOutlet var scrollWidth: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollWidth.contentSize.width = 1456
    }
}

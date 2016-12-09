//
//  counselorViewController.swift
//  OliveAndGold
//  Created by Evan Heffernan Computer on 5/9/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//
import UIKit

class counselorViewController: UIViewController {

    var arrayIndex: Int!
    var fillingArray: [String]!
    
    @IBOutlet weak var job: UITextField!
    @IBOutlet weak var imageA: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var info1: UITextField!
    @IBOutlet weak var info2: UITextField!
    @IBOutlet weak var info3: UITextField!
    @IBOutlet weak var info4: UITextField!
    @IBOutlet weak var info5: UITextField!
    @IBOutlet weak var info6: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch arrayIndex {
            case 1:
                fillingArray = CellElements.sharedInstance.counselor1
                break;
            case 2:
                fillingArray = CellElements.sharedInstance.counselor2
                break;
            case 3:
                fillingArray = CellElements.sharedInstance.counselor3
                break;
            case 4:
                fillingArray = CellElements.sharedInstance.counselor4
                break;
            case 5:
                fillingArray = CellElements.sharedInstance.counselor5
                break;
            case 6:
                fillingArray = CellElements.sharedInstance.counselor6
                break;
            case 7:
                fillingArray = CellElements.sharedInstance.counselor7
                break;
            case 8:
                fillingArray = CellElements.sharedInstance.counselor8
                break;
            default:
                fillingArray = CellElements.sharedInstance.counselor1
        }
        
        job.text = fillingArray[0]
        let img = UIImage(named: "\(fillingArray[1])")
        imageA.image = img
        name.text = fillingArray[2]
        email.text = fillingArray[3]
        info1.text = fillingArray[4]
        info2.text = fillingArray[5]
        info3.text = fillingArray[6]
        info4.text = fillingArray[7]
        info5.text = fillingArray[8]
        info6.text = fillingArray[9]
    }
    
//    override func viewWillAppear(animated: Bool) {
//        imageA = UIImageView(image: UIImage(named: "largeBarr.jpg"))
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

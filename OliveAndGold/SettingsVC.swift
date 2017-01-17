//
//  SettingsVC.swift
//  OliveAndGold
//
//  Created by Mobile on 1/17/17.
//  Copyright © 2017 com.4myeecc. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    @IBOutlet weak var notificationsToggle: UISwitch!
    @IBOutlet weak var darkToggle: UISwitch!
    @IBOutlet weak var fontSlider: UISlider!
    @IBOutlet weak var fontLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarItem.image = UIImage(named: "settingsTabIcon")
        self.tabBarItem.title = "Settings"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fontSliderChangedValue(_ sender: UISlider) {
        fontLabel.text = String(Int(fontSlider.value))
    }

    @IBAction func notificationToggleChanged(_ sender: UISwitch) {
    }
    
    @IBAction func darkToggleChanged(_ sender: UISwitch) {
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

//
//  AppDelegate.swift
//  OliveAndGold
//  Created by Evan Heffernan on 4/12/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Initialize Firebase
        FIRApp.configure()
        
        // Get references to the storyboards
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let adminStoryboard = UIStoryboard(name: "AdminStoryboard", bundle: nil)
        let athleticsStoryboard = UIStoryboard(name: "Athletics", bundle: nil)
        
        // Get the Admin tab view controller from the storyboard
        let adminTabVC = adminStoryboard.instantiateViewController(withIdentifier: "AdminNavVC") as! UINavigationController
        
        // Get the CCC tab view controller from the storyboard
        let cccTabVC = storyboard.instantiateViewController(withIdentifier: "CCCNavVC") as! UINavigationController
        
        // Get the Athletics tab view controller from the storyboard
        let athleticsTabVC = athleticsStoryboard.instantiateViewController(withIdentifier: "AthleticsVC") as! AthleticsViewController
        
        // Get the Special Programs tab view controller from the storyboard
        let specialTabVC = storyboard.instantiateViewController(withIdentifier: "SpecialNavVC") as! UINavigationController
        
        // Get the Settings tab view controller from the storyboard
        let settingsTabVC = storyboard.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        
        // Make a tab bar controller and set its tabs (view controller array)
        let tabVC = UITabBarController()
        tabVC.viewControllers = [adminTabVC, cccTabVC, athleticsTabVC, specialTabVC, settingsTabVC]
        
        // Creating the tab bar controller in code means that the window property
        // of this class is nil, (normally window is set to the starting VC from the storyboard)
        // So make a new one and set it as the main window of this app
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = tabVC
        window?.makeKeyAndVisible()  // make this the main window and display it
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


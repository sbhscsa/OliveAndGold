//
//  PageViewController.swift
//  OliveGoldMasterView
//
//  Created by Nathan on 1/7/20.
//  Copyright © 2020 NateLabs. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var info: ProgStruct!
    
// make "lazy" because instantiating is expensive
    lazy var pageVCs: [UIViewController] = self.retrieveViewControllers()
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        self.configurePageControl()
        
        // From Apple: "The value of this property (self.transitionStyle) is set when
        // the page view controller is initialized, and cannot be changed."
        // Sooooo, you do it in the attributes inspector in the storyboard.
        //self.transitionStyle = UIPageViewController.TransitionStyle.scroll
        
        // set first view controller (it's plural because there could be a splitVC eg on iPad)
        self.setViewControllers([self.pageVCs[0]], direction: .forward, animated: true, completion: nil)
    }
    
    // Required for Datasource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // Get current page index
        let currentIndex = self.pageVCs.firstIndex(of: viewController)!
        let nextIndex = currentIndex + 1
        // if on the last page, this disallows looping back to first page
        if nextIndex >= self.pageVCs.count {
            return pageVCs.first
            // could return pageVCs.first if allowing looping
        }
        
        // don't go out of bounds with the index (does this really happen?)
        if self.pageVCs.count <= nextIndex {
            return nil
        }
        
        return self.pageVCs[nextIndex]
    }
    
    // MARK: Datasource functions
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // Get current page index
        let currentIndex = self.pageVCs.firstIndex(of: viewController)!
        let previousIndex = currentIndex - 1
        // if on the first page, this disallows looping back to last page
        if previousIndex < 0 {
            return pageVCs.last
            // could return pageVCs.last if allowing looping
        }
        
        // don't go out of bounds with the index (does this really happen?)
        if self.pageVCs.count <= previousIndex {
            return nil
        }
        
        return self.pageVCs[previousIndex]
    }
    
    //MARK: list view controllers
    
    func retrieveViewControllers()->[UIViewController]{
        var list = [UIViewController]()
        let vc = createViewcontroller(withName: "LogoVC") as! LogoViewController
        vc.mainStruct = info
        list.append(vc)
        
        let vc3 = createViewcontroller(withName: "StaffVC") as! StaffViewController
        vc3.mainStruct = info
        list.append(vc3)
        
        let vc2 = createViewcontroller(withName: "MiscVC") as! MiscViewController
        vc2.mainStruct = info
        list.append(vc2)
        
        return list
    }
    
    func createViewcontroller(withName name: String) -> UIViewController
    {
        let temp = (storyboard?.instantiateViewController(withIdentifier: name))!
        //temp.info = self.info
        
        return temp
    }
    
    // MARK: Delegate functions
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        // I'm not sure I understand why this is always index 0:
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = self.pageVCs.firstIndex(of: pageContentViewController)!
    }
    
    func configurePageControl() {
        // status bar height + nav bar height, offset because
        let pcHeight : CGFloat = 40
        let statHeight : CGFloat = UIApplication.shared.statusBarFrame.size.height
        let nbHeight : CGFloat = self.navigationController!.navigationBar.frame.size.height
        let tbHeight : CGFloat = self.tabBarController?.tabBar.bounds.size.height ?? 112
        let startY : CGFloat = self.view.bounds.origin.y + statHeight + nbHeight + tbHeight + pcHeight
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - startY, width: UIScreen.main.bounds.width, height: pcHeight))
        self.pageControl.numberOfPages = self.pageVCs.count
        self.pageControl.currentPage = 0
        //self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}





    


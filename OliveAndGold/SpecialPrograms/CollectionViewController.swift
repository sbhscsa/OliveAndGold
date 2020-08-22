//
//  CollectionViewController.swift
//  OliveGoldMasterView
//
//  Created by Nathan on 1/6/20.
//  Copyright © 2020 NateLabs. All rights reserved.
//

import UIKit




class CollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = "Cell"
    
    var infoForCells: [ProgStruct] = ProgData.sharedInstance.progs
    
    
    let margin: CGFloat = 10
    let cellsPerRow = 2
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarItem.image = UIImage(named: "specialTabIcon")
        self.tabBarItem.title = "Special Programs"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(displayP3Red: 38, green: 57, blue: 30, alpha: 0)
        
        
        self.navigationItem.title = "Special Programs"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 155/255, green: 142/255, blue: 94/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.green
        
        //self.navigationController?.navigationBar.barTintColor = UIColor.green
        
    }
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC : PageViewController = segue.destination as! PageViewController
        destVC.info = infoForCells[self.collectionView.indexPath(for: sender as! UICollectionViewCell)!.row]
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return infoForCells.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        // Configure the cell
        let titleLabel = cell.viewWithTag(1) as! UILabel
        let expTitleLabel = cell.viewWithTag(2) as! UILabel
        let logoView = cell.viewWithTag(3) as! UIImageView
        let backView = cell.viewWithTag(4) as! UIImageView
        let typeView = cell.viewWithTag(5) as! UIImageView
        
        logoView.contentMode = .scaleAspectFit
        backView.contentMode = .scaleAspectFill
        typeView.contentMode = .scaleAspectFit
        
        titleLabel.text =  infoForCells[indexPath.item].programName
        expTitleLabel.text = infoForCells[indexPath.item].expandedName
        logoView.image = UIImage(named: infoForCells[indexPath.item].logo)!
        backView.image = UIImage(named: infoForCells[indexPath.item].background)!.blurred(radius: UIImage(named:infoForCells[indexPath.item].background)!.size.width/400).darkened()
        
        if infoForCells[indexPath.item].type != "Default"
        {
            typeView.image = UIImage(named: infoForCells[indexPath.item].type)!
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath){
         // if cell.isSelected {
            let titleLabel = cell.viewWithTag(1) as! UILabel
            titleLabel.textColor = .red
          //}
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath){
         // if cell.isSelected {
            let titleLabel = cell.viewWithTag(1) as! UILabel
            titleLabel.textColor = .lightText
          //}
        }
    }
    
    override func viewWillLayoutSubviews() {
        guard let collectionView = collectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        flowLayout.itemSize =  CGSize(width: itemWidth, height: itemWidth)
    }
    
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}

extension UIImage {
    func blurred(radius: CGFloat) -> UIImage {
        let ciContext = CIContext(options: nil)
        guard let cgImage = cgImage else { return self }
        let inputImage = CIImage(cgImage: cgImage)
        guard let ciFilter = CIFilter(name: "CIGaussianBlur") else { return self }
        ciFilter.setValue(inputImage, forKey: kCIInputImageKey)
        ciFilter.setValue(radius, forKey: "inputRadius")
        guard let resultImage = ciFilter.value(forKey: kCIOutputImageKey) as? CIImage else { return self }
        guard let cgImage2 = ciContext.createCGImage(resultImage, from: inputImage.extent) else { return self }
        return UIImage(cgImage: cgImage2)
    }
    
    
    func darkened() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer { UIGraphicsEndImageContext() }
        
        guard let ctx = UIGraphicsGetCurrentContext(), let cgImage = cgImage else {
            return nil
        }
        
        // flip the image, or result appears flipped
        ctx.scaleBy(x: 1.0, y: -1.0)
        ctx.translateBy(x: 0, y: -size.height)
        
        let rect = CGRect(origin: .zero, size: size)
        ctx.draw(cgImage, in: rect)
        UIColor(white: 0, alpha: 0.5).setFill()
        ctx.fill(rect)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}


//
//  TableOneViewController.swift
//  OliveAndGold
//  Created by Evan Heffernan on 4/12/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import UIKit
import MessageUI

class TableOneViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    var email: String!
    var mailComposer : MFMailComposeViewController!
    
    @IBOutlet weak var barrImage: UIImageView!
    @IBOutlet weak var cortesImage: UIImageView!
    @IBOutlet weak var porterImage: UIImageView!
    @IBOutlet weak var adamsImage: UIImageView!
    @IBOutlet weak var gilImage: UIImageView!
    @IBOutlet weak var acevedoImage: UIImageView!
    @IBOutlet weak var kerstiensImage: UIImageView!
    @IBOutlet weak var snyderImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        scrollView.contentSize.width = 1936
        scrollView.contentSize.height = 134
        self.view.backgroundColor = UIColor(red: 172/255.0, green: 140/255.0, blue: 53/255.0, alpha: 1)
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(TableOneViewController.barrImageTapped(_:)))
        barrImage.addGestureRecognizer(tapGesture1)
        barrImage.isUserInteractionEnabled = true
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(TableOneViewController.cortesImageTapped(_:)))
        cortesImage.addGestureRecognizer(tapGesture2)
        cortesImage.isUserInteractionEnabled = true
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(TableOneViewController.porterImageTapped(_:)))
        porterImage.addGestureRecognizer(tapGesture3)
        porterImage.isUserInteractionEnabled = true
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(TableOneViewController.adamsImageTapped(_:)))
        adamsImage.addGestureRecognizer(tapGesture4)
        adamsImage.isUserInteractionEnabled = true
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(TableOneViewController.kerstiensImageTapped(_:)))
        gilImage.addGestureRecognizer(tapGesture5)
        gilImage.isUserInteractionEnabled = true
        let tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(TableOneViewController.acevedoImageTapped(_:)))
        acevedoImage.addGestureRecognizer(tapGesture6)
        acevedoImage.isUserInteractionEnabled = true
        let tapGesture7 = UITapGestureRecognizer(target: self, action: #selector(TableOneViewController.gilImageTapped(_:)))
        kerstiensImage.addGestureRecognizer(tapGesture7)
        kerstiensImage.isUserInteractionEnabled = true
        let tapGesture8 = UITapGestureRecognizer(target: self, action: #selector(TableOneViewController.snyderImageTapped(_:)))
        snyderImage.addGestureRecognizer(tapGesture8)
        snyderImage.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return CellElements.sharedInstance.oneElementsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ElementRow", for: indexPath)
        let label = cell.viewWithTag(11) as! UILabel
        let categories = CellElements.sharedInstance.oneElementsArray
        label.text = categories[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushToSecondView"{
            let secondCells = segue.destination as! SecondViewController
            let cellRow = sender as! UITableViewCell
            let rowNum = tableView.indexPath(for: cellRow)?.row
            secondCells.cellDictionary = CellElements.sharedInstance.newArrays[rowNum!]
            secondCells.firstTableNum = rowNum
        }
    }
    
    @IBAction func emailBarr(_ sender: AnyObject) {
        self.configureMail("sbarr@sbunified.org")
    }
    
    @IBAction func emailCortes(_ sender: AnyObject) {
        self.configureMail("ecortes@sbunified.org")
    }
    
    @IBAction func emailPorter(_ sender: AnyObject) {
        self.configureMail("mporter@sbunified.org")
    }
    
    @IBAction func emailAdams(_ sender: AnyObject) {
        self.configureMail("adams@sbunified.org")
    }
    
    @IBAction func emailGil(_ sender: AnyObject) {
        self.configureMail("rgil@sbunified.org")
    }
    
    @IBAction func emailAcevedo(_ sender: AnyObject) {
        self.configureMail("macevedo@sbunified.org")
    }
    
    @IBAction func emailKerstiens(_ sender: AnyObject) {
        self.configureMail("kkerstiens@sbunified.org")
    }
    
    @IBAction func emailSnyder(_ sender: AnyObject) {
        self.configureMail("ssnyder@sbunified.org")
    }
    
    
    func configureMail(_ email: String){
        let sendTo = email
        mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients([sendTo])
        self.present(mailComposer, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        switch result{
        case .cancelled:
            print("Mail Cancelled")
        case .saved:
            print("Result Saved")
        case .sent:
            print("Result Sent")
        case .failed:
            print("Mail sent failure: \(error?.localizedDescription)")
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
        mailComposer = nil
    }
    
    func barrImageTapped(_ geture: UIGestureRecognizer){
        let cVC = storyboard?.instantiateViewController(withIdentifier: "barr") as! counselorViewController
        cVC.arrayIndex = 1
        self.navigationController?.pushViewController(cVC, animated: true)
   }
    
    func cortesImageTapped(_ geture: UIGestureRecognizer){
        let cVC = storyboard?.instantiateViewController(withIdentifier: "barr") as! counselorViewController
        cVC.arrayIndex = 2
        self.navigationController?.pushViewController(cVC, animated: true)
    }
    
    func porterImageTapped(_ geture: UIGestureRecognizer){
        let cVC = storyboard?.instantiateViewController(withIdentifier: "barr") as! counselorViewController
        cVC.arrayIndex = 3
        self.navigationController?.pushViewController(cVC, animated: true)
    }
    
    func adamsImageTapped(_ geture: UIGestureRecognizer){
        let cVC = storyboard?.instantiateViewController(withIdentifier: "barr") as! counselorViewController
        cVC.arrayIndex = 4
        self.navigationController?.pushViewController(cVC, animated: true)
    }
    
    func kerstiensImageTapped(_ geture: UIGestureRecognizer){
        let cVC = storyboard?.instantiateViewController(withIdentifier: "barr") as! counselorViewController
        cVC.arrayIndex = 5
        self.navigationController?.pushViewController(cVC, animated: true)
    }
    
    func acevedoImageTapped(_ geture: UIGestureRecognizer){
        let cVC = storyboard?.instantiateViewController(withIdentifier: "barr") as! counselorViewController
        cVC.arrayIndex = 6
        self.navigationController?.pushViewController(cVC, animated: true)
    }
    
    func gilImageTapped(_ geture: UIGestureRecognizer){
        let cVC = storyboard?.instantiateViewController(withIdentifier: "barr") as! counselorViewController
        cVC.arrayIndex = 7
        self.navigationController?.pushViewController(cVC, animated: true)
    }
    
    func snyderImageTapped(_ geture: UIGestureRecognizer){
        let cVC = storyboard?.instantiateViewController(withIdentifier: "barr") as! counselorViewController
        cVC.arrayIndex = 8
        self.navigationController?.pushViewController(cVC, animated: true)
    }
}


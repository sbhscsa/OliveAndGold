//
//  ViewController.swift
//  TestUI
//
//  Created by Mobile on 1/7/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit



struct Academy {
    let name: String
    let mStatement:String
    let imageName: String
   
}



class LogoViewController: UIViewController {
    var mainStruct: ProgStruct!

    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var Title1: UILabel!
    @IBOutlet weak var mStatement1: UILabel!
    
    //var academies = [Academy]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        let CSA = Academy(name: "Computer Science Academy", mStatement: "The CS Academy’s mission is to expose as many SBHS students as possible to computer science and to demonstrate its relevance to their academic and career interests. Through innovative courses, opportunities outside the classroom, and industry partnerships, academy students will expand their knowledge and experience in computer science. This Career Technical Education (CTE) program will prepare students to pursue a career in this dynamic field.", imageName: "CSALOGO")
//
//        let MAD = Academy(name: "Multimedia Art and Design", mStatement: "The MAD Academy is a four year \"school within a school\" at Santa Barbara High School. Stuents take an integrated curriculum comprissed of pre-AP, Honors & AP level academic requirements & college classes in Graphic Design, Film, Photography, Socia Media & Web Design.", imageName: "MADLOGO")
//
//        let VADA = Academy(name: "Visual Arts and Design Academy", mStatement: "The Visual Arts and Design Academy (VADA) is a unique \"school-within-a-school\" that integreates rigorous academic coursework with project-based, career-focused art and design instruction, in a supportive and creative environment.", imageName: "VADALOGO")
//
//        let THEATRE = Academy(name: "Theatre", mStatement: "\"Leap, and a net will appear.\"", imageName: "THEATRELOGO")
//
//        let SPORTSMED = Academy(name: "Sports Medicine", mStatement:"Our pathway intent is to build upon student interests by expanding their knowledge and their skill set to excel in the post high school course work necessary for their career goals.", imageName:
//
//        )
        
        
        
        //let acad = MAD // IF BUTTON PRSSED SET acad TO academy pressed
        
//        self.academies.append(CSA)
//        self.academies.append(MAD)
//        self.academies.append(VADA)
        
        self.logoView.image = UIImage(named: mainStruct.bigLogo)
        self.mStatement1.text = String(mainStruct.statement)
        self.Title1.text = mainStruct.expandedName
        


        
    }


}




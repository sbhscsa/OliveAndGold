//
//  Elements.swift
//  OliveAndGold
//  Created by Evan Heffernan on 4/12/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import Foundation

class CellElements {
    static let sharedInstance = CellElements()
    
    
    var cell0: [String:String]!
    var cell1: [String:String]!
    var cell2: [String:String]!
    var cell3: [String:String]!
    var cell4: [String:String]!
    var cell5: [String:String]!
    var cell6: [String:String]!
    var cell7: [String:String]!
    var cell8: [String:String]!
    var counselor1: [String]!
    var counselor2: [String]!
    var counselor3: [String]!
    var counselor4: [String]!
    var counselor5: [String]!
    var counselor6: [String]!
    var counselor7: [String]!
    var counselor8: [String]!
    let oneElementsArray: [String]
    let counselorArray: [[String]]
    let newArrays: [Dictionary<String,String>]
    
    init()
    {
        cell2 = ["Why should I go to college?":"https://www.commonapp.org/why-go-college", "The different types of colleges":"https://www.collegeraptor.com/college-guide/college-search/every-kind-of-college-and-university-defined/", "How do I research colleges?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=736497", "Completing the Common Application":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=736663", "Common App Website":"http://www.commonapp.org/ready", "Completing the UC Application":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=723071", "Completing the CSU Application":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=724013", "What is the Coalition Application?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=926314", "What can I do over the summer?":"https://bigfuture.collegeboard.org/get-started/inside-the-classroom/summer-learning-programs-what-why-and-how", "The College Interview":"https://bigfuture.collegeboard.org/get-in/interviews/college-interviews-practice-questions-and-strategies", "How do I send my SAT test scores?":"https://collegereadiness.collegeboard.org/sat/scores/sending-scores/how-to-send", "How do I send my ACT test scores?":"http://www.act.org/content/act/en/products-and-services/the-act/your-scores.html", "Early Decision vs. Early Action":"https://professionals.collegeboard.org/guidance/applications/early", "How can I attend College Visits to SBHS?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708106", "What about visiting colleges?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708106", "Completing the SBCC application":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=723070", "I want to play a sport in college":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=716446"]
        cell0 = ["What makes a great essay? (Princeton Review)":"http://www.princetonreview.com/college-advice/college-essay", "What makes a great essay? (Big Future)":"https://bigfuture.collegeboard.org/get-in/essays/8-tips-for-crafting-your-best-college-essay", "What makes a great essay? (NacaNet)":"http://www.nacacnet.org/studentinfo/articles/Pages/Writing-a-College-Essay-Top-Ten.aspx", "Answering the personal insight questions for UC's":"http://admission.universityofcalifornia.edu/how-to-apply/personal-questions/freshman/index.html"]
        cell7 = ["What are letters of rec and do I need them?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=763713", "What are brag sheets?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=763713", "How many letters of rec do I need?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=763713"]
        cell3 = ["The differences between College Tests?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=924557","ACT vs. SAT":"http://www.princetonreview.com/college/sat-act", "Which tests do I submit to colleges?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=924557", "How do I send my SAT test scores?":"https://collegereadiness.collegeboard.org/sat/scores/sending-scores/how-to-send", "How do I send my ACT test scores?":"http://www.act.org/content/act/en/products-and-services/the-act/your-scores.html", "Qualify for testing accommodations":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=924557", "Shmoop":"http://www.shmoop.com/", "Shmoop Information":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=924557", "Khan Academy":"https://www.khanacademy.org/sat", "What about Subject Tests?":"https://collegereadiness.collegeboard.org/sat-subject-tests/about", "What colleges will accept AP scores?":"https://apstudent.collegeboard.org/creditandplacement/search-credit-policies"]
        cell4 = ["Community service hours needed to graduate high school":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708099", "Community service hours needed for college":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708099", "The activities section of the UC Application":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=723071"]
        cell8 = ["How do I search for colleges?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=717543", "The 'colleges i'm applying to' section":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=717543", "Searching for scholarships":"http://www.naviance.com/college-and-career-readiness-platform/college-planning/scholarship-search", "How do I search for careers?":"http://www.naviance.com/college-and-career-readiness-platform/career-exploration", "Finding summer/enrichment programs in Naviance?":"http://www.naviance.com/college-and-career-readiness-platform/college-planning/scholarship-search"]
        cell1 = ["Career Search using Naviance":"http://www.naviance.com/college-and-career-readiness-platform/career-exploration", "California Career Zone Search":"http://www.cacareerzone.org", "Completing a Work Permit for a job":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708096", "How do I build a resume?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708096", "Using LinkedIn for a virtual resume":"https://www.linkedin.com"]
        cell5 = ["How am I going to pay for College?":"https://www.commonapp.org/how-pay-college", "How do I fill out the FAFSA?":"https://www.salliemae.com/plan-for-college/financial-aid/fafsa/", "What is the CSS PROFILE?":"https://student.collegeboard.org/css-financial-aid-profile", "Applying for SBCC scholarships":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=723070", "Where else can I find scholarships?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708100", "What is Work Study?":"https://studentaid.ed.gov/sa/types/work-study", "Subsidized vs. unsubsidized student loans":"https://studentaid.ed.gov/sa/types/loans/subsidized-unsubsidized#subsidized-vs-unsubsidized", "What is a parent plus loan?":"https://studentaid.ed.gov/sa/types/loans/plus", "Financial Aid dictionary of terms":"http://www.usnews.com/education/blogs/the-scholarship-coach/2012/07/19/12-college-financial-aid-terms-defined", "Understand my Financial Aid Award Letter":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708100"]
        cell6 = ["What is a Gap Year?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=716447", "Should I consider taking a Gap Year?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=716447", "Should I do a summer program?":"https://bigfuture.collegeboard.org/get-started/inside-the-classroom/summer-learning-programs-what-why-and-how"]
        oneElementsArray = ["Ace Your College Essay", "Career Search & Tips", "College Application", "College Tests and Preparation", "Extracurricular Activities", "Financial Aid", "Gap Year and Summer Programs", "Letters of Recommendation", "Naviance"]
        newArrays = [cell0, cell1, cell2, cell3, cell4, cell5, cell6,cell7, cell8]
        
        counselor1 = ["College & Career Counselor, Academy for Success", "largeBarr.jpg", "Spencer Barr", "sbarr@sbunified.org", "B.A. History & Art History, University of California, Santa Barbara", "M.S. Educational Counseling, University of La Verne", "Pupil Personnel Services Credential, University of La Verne", "College Admissions Specialist, ASCA", "School Counselor Data Specialist, ASCA", "School Counselor Leadership Specialist, ASCA"]
        counselor2 = ["PEAC Counselor", "largeCortes.jpg", "Edith Cortes", "largeCortes@sbunified.org", "B.S. Sociology, University of California, Riverside", "M.S. Educational Counseling, University of La Verne", "Pupil Personnel Services Credential, University of La Verne", "  ", "  ", "  "]
        counselor3 = ["Guidance Counselor, A-Co", "largePorter.jpg", "Marcy Porter", "mporter@sbunified.org", "B.A. Psychology, Biola University", "M.A. Educational Counseling, University of La Verne", "Pupil Personnel Services Credential, University of La Verne", "  ", "  ", "  "]
        counselor4 = ["Guidance Counselor, Man-P", "largeAdams.jpg", "Alicia Adams", "adams@sbunified.org", "B.A. Communications, University of California, SB", "M.S. Counseling and Guidance, CA Lutheran University", "Multiple Subject Teaching Credential, Antioch University", "Pupil Personnel Services Credential, CA Lutheran University", "  ", "  "]
        counselor5 = ["Guidance Counselor, Cr-Gue", "largeGil.png", "Ruben Gil", "rgil@sbunified.org", "", "M.A. Educational Counseling, Azusa Pacific University", "Pupil Personnel Services Credential, Cal State University Northridge", "   ", "   ", "   "]
        counselor6 = ["Guidance Counselor, Gui-Mal", "largeAcevedo.jpg", "Martha Acevedo", "macevedo@sbunified.org", "B.A. Spanish Literature, University of California, SB", "Single Subject Teaching Credential - UCSB", "Bilingual Certificate K-12", "M.A. Educational Counseling, California Lutheran University", "Pupil Personnel Services Credential, CA Lutheran University", "   "]
        counselor7 = ["Guidance Counselor, Qu-Sam", "largeKerstiens.png", "Kara Kerstiens", "kkerstiens@sbunified.org", "B.A. Psychology, University of California, Santa Barbara", "M.S. Counseling and Guidance, California Lutheran University", "Pupil Personnel Services Credential, California Lutheran University", "", "   ", "   "]
        counselor8 = ["Guidance Counselor, San-Z and International Students ", "largeSnyder.jpg", "Susan Snyder", "ssnyder@sbunified.org", "B.A. Biology, University of California, Santa Cruz", "Single Subject Teaching Credential, CSU, SLO", "Certificate College Counseling, University of California, SD", "Certificate Advanced Spanish, La Universidad de La Havana", "M.A. Educational Counseling, Chapman University", "Pupil Personnel Services Credential, Chapman University"]
        counselorArray = [counselor1, counselor2, counselor3, counselor4, counselor5, counselor6, counselor7, counselor8]
    }
}
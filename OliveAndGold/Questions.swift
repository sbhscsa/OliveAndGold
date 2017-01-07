//
//  Questions.swift
//  OliveAndGold
//
//  Created by Trip Creighton on 12/14/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import Foundation

/* 
    - This is the master class for each of the questions.
    - I have this here because it is more readable and accessable retrieving them from here.
 */

class Questions {
    private var questionList:[[String:String]]! = [[String:String]](),
                sectionList:[String:[String:String]]!,
                sectionNames:[String]!
    init() {
        setupQuestions()
    }
    
    //Feel free to move this to the constructor, however I only do this so the constructor is more readable!
    private func setupQuestions(){
        print("[DBG] Setting up questions & urls")
        let collegeReason = ["Why should I go to college?":"https://www.commonapp.org/why-go-college", "The different types of colleges":"https://www.collegeraptor.com/college-guide/college-search/every-kind-of-college-and-university-defined/", "How do I research colleges?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=736497", "Completing the Common Application":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=736663", "Common App Website":"http://www.commonapp.org/ready", "Completing the UC Application":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=723071", "Completing the CSU Application":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=724013", "What is the Coalition Application?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=926314", "What can I do over the summer?":"https://bigfuture.collegeboard.org/get-started/inside-the-classroom/summer-learning-programs-what-why-and-how", "The College Interview":"https://bigfuture.collegeboard.org/get-in/interviews/college-interviews-practice-questions-and-strategies", "How do I send my SAT test scores?":"https://collegereadiness.collegeboard.org/sat/scores/sending-scores/how-to-send", "How do I send my ACT test scores?":"http://www.act.org/content/act/en/products-and-services/the-act/your-scores.html", "Early Decision vs. Early Action":"https://professionals.collegeboard.org/guidance/applications/early", "How can I attend College Visits to SBHS?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708106", "What about visiting colleges?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708106", "Completing the SBCC application":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=723070", "I want to play a sport in college":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=716446"]
        
        let greatEssay = ["What makes a great essay? (Princeton Review)":"http://www.princetonreview.com/college-advice/college-essay", "What makes a great essay? (Big Future)":"https://bigfuture.collegeboard.org/get-in/essays/8-tips-for-crafting-your-best-college-essay", "What makes a great essay? (NacaNet)":"http://www.nacacnet.org/studentinfo/articles/Pages/Writing-a-College-Essay-Top-Ten.aspx", "Answering the personal insight questions for UC's":"http://admission.universityofcalifornia.edu/how-to-apply/personal-questions/freshman/index.html"]
        
        let lettersRec = ["What are letters of rec and do I need them?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=763713", "What are brag sheets?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=763713", "How many letters of rec do I need?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=763713"]
        
        let collegeTests = ["The differences between College Tests?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=924557","ACT vs. SAT":"http://www.princetonreview.com/college/sat-act", "Which tests do I submit to colleges?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=924557", "How do I send my SAT test scores?":"https://collegereadiness.collegeboard.org/sat/scores/sending-scores/how-to-send", "How do I send my ACT test scores?":"http://www.act.org/content/act/en/products-and-services/the-act/your-scores.html", "Qualify for testing accommodations":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=924557", "Shmoop":"http://www.shmoop.com/", "Shmoop Information":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=924557", "Khan Academy":"https://www.khanacademy.org/sat", "What about Subject Tests?":"https://collegereadiness.collegeboard.org/sat-subject-tests/about", "What colleges will accept AP scores?":"https://apstudent.collegeboard.org/creditandplacement/search-credit-policies"]
        
        let communityService = ["Community service hours needed to graduate high school":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708099", "Community service hours needed for college":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708099", "The activities section of the UC Application":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=723071"]
        
        let searchColleges = ["How do I search for colleges?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=717543", "The 'colleges i'm applying to' section":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=717543", "Searching for scholarships":"http://www.naviance.com/college-and-career-readiness-platform/college-planning/scholarship-search", "How do I search for careers?":"http://www.naviance.com/college-and-career-readiness-platform/career-exploration", "Finding summer/enrichment programs in Naviance?":"http://www.naviance.com/college-and-career-readiness-platform/college-planning/scholarship-search"]
        
        let careerSearch = ["Career Search using Naviance":"http://www.naviance.com/college-and-career-readiness-platform/career-exploration", "California Career Zone Search":"http://www.cacareerzone.org", "Completing a Work Permit for a job":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708096", "How do I build a resume?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708096", "Using LinkedIn for a virtual resume":"https://www.linkedin.com"]
       
        let payCollege = ["How am I going to pay for College?":"https://www.commonapp.org/how-pay-college", "How do I fill out the FAFSA?":"https://www.salliemae.com/plan-for-college/financial-aid/fafsa/", "What is the CSS PROFILE?":"https://student.collegeboard.org/css-financial-aid-profile", "Applying for SBCC scholarships":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=316128&type=d&pREC_ID=723070", "Where else can I find scholarships?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708100", "What is Work Study?":"https://studentaid.ed.gov/sa/types/work-study", "Subsidized vs. unsubsidized student loans":"https://studentaid.ed.gov/sa/types/loans/subsidized-unsubsidized#subsidized-vs-unsubsidized", "What is a parent plus loan?":"https://studentaid.ed.gov/sa/types/loans/plus", "Financial Aid dictionary of terms":"http://www.usnews.com/education/blogs/the-scholarship-coach/2012/07/19/12-college-financial-aid-terms-defined", "Understand my Financial Aid Award Letter":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=708100"]
        
        let gapYear = ["What is a Gap Year?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=716447", "Should I consider taking a Gap Year?":"http://sbhs.sbunified.org/apps/pages/index.jsp?uREC_ID=306249&type=d&pREC_ID=716447", "Should I do a summer program?":"https://bigfuture.collegeboard.org/get-started/inside-the-classroom/summer-learning-programs-what-why-and-how"]
        
        
        //Sections which contains each list of each question and URL
        sectionList = ["Ace Your College Essay":greatEssay,
                       "Career Search & Tips":careerSearch,
                       "College Application":collegeReason,
                       "College Tests and Preparation":collegeTests,
                       "Extracurricular Activities":communityService,
                       "Financial Aid":payCollege,
                       "Gap Year and Summer Programs":gapYear,
                       "Letters of Recommendation":lettersRec,
                       "Naviance":searchColleges]

        //Individual section names
        sectionNames = ["Ace Your College Essay",
                    "Career Search & Tips",
                    "College Application",
                    "College Tests and Preparation",
                    "Extracurricular Activities",
                    "Financial Aid",
                    "Gap Year and Summer Programs",
                    "Letters of Recommendation",
                    "Naviance"]
        
        questionList = [greatEssay, careerSearch, collegeReason, collegeTests, communityService, payCollege, gapYear,lettersRec, searchColleges]

    }
    
    func getSection(byName: String) -> [String:String]? {
        for section in sectionList {
            if section.key == byName || section.key.contains(byName) {
                return section.value
            }
        }
        return nil
    }
    
    
    func getSectionList() -> [String:[String:String]] {
        return sectionList
    }
    
    func getQuestionList() -> [[String:String]] {
        return questionList
    }
    
    func getSectionNames() -> [String] {
        return sectionNames
    }
}

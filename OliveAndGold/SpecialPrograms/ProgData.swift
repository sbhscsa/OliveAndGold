//
//  File.swift
//  OliveGoldMasterView
//
//  Created by Nathan on 1/8/20.
//  Copyright © 2020 NateLabs. All rights reserved.
//

import Foundation
import Firebase
import CodableFirebase

struct Pathway : Decodable {
    var name = ""
    var features = ""
    var courses = ""
    var socialMedia = ""
    var donationLink = ""
}

struct SPStaffMember : Decodable {
    var imageName = ""
    var name = ""
    var title = ""
    var email = ""
}

struct ProgStruct : Decodable {
    var programName = ""
    var expandedName = ""
    var type = "Default"
    var logo = "SBHSLogo"
    var bigLogo = "SBHSLogo"
    var background = "SBHSBack"
    var statement = ""
    var director:SPStaffMember
    var SPStaffMembers:[SPStaffMember]
    var miscInfo:Pathway
}

// This is a Singleton. Much like the Math class in Java, it provides a single
// shared object for use, rather than multiple individual objects (instantiations) of the class.
// Singletons are useful when class objects hold data that doesn't change (e.g. Pi).
// You know you might want a Singleton if each instance of an object of the class would be identical
// and likely wouldn't change much, if at all. Singletons are implemented as static classes.

// ACCESS THE SINGLETON FROM OTHER CLASSES LIKE THIS:
// let myData = ProgData.sharedInstance.progs

class ProgData {
    static let sharedInstance = ProgData() // calls the constructor (init)
    var progs = [ProgStruct]()
//    let file = "OGSPjson.json"
    var fbRef: FIRDatabaseReference!
        
    init() {
         // get links
        fbRef = FIRDatabase.database().reference()
        
        fbRef.child("academiesPathwaysPrograms").observeSingleEvent(of: .value, with: { (snapshot) in
            guard let value = snapshot.value else { return }
            do {
                let allData = try FirebaseDecoder().decode([ProgStruct].self, from: value)
//                print(allData)
                self.progs = allData
            } catch let error {
                print(error)
            }
            
//            let decoder = JSONDecoder()
//
//            guard let loaded = try? decoder.decode([ProgStruct].self, from: url) else {
//                fatalError("Failed to decode special programs data from firebase.")
//            }
//
//            self.progs = loaded
        })
//        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
//            fatalError("Failed to locate \(file) in bundle.")
//        }

        /*
        // CSA
        self.progs.append(
            ProgStruct(programName: "CS Academy",
                       expandedName: "Computer Science Academy",
                       type: "Acad",
                       logo: "CSALogo",
                       bigLogo: "CSABigLogo",
                       background: "CSABack",
                       statement: "\"Collaborate, Create, Change the World!\"",
                       director: SPStaffMember(imageName: "adams", name: "Sky Adams", title: "Director", email: "skyadams@sbunified.org"),
                       SPStaffMembers: [
                        SPStaffMember(imageName: "stewart", name: "Kyle Stewart", title: "Instructor", email: "kstewart@sbunified.org"),
                        SPStaffMember(imageName: "johnston", name: "Richard Johnston", title: "Instructor", email: "rjohnston@sbunified.org"),
                        SPStaffMember(imageName: "muhl", name: "Paul Muhl", title: "Instructor", email: "pmuhl@sbunified.org"),
                        SPStaffMember(imageName: "velasco", name: "Joe Velasco", title: "Instructor", email: "jvelasco@sbunified.org"),
                        SPStaffMember(imageName: "moschitto", name: "Daisy Moschitto", title: "Administrative Support", email: "dmoschitto@sbunified.org")],
                       miscInfo: Pathway(name: "CSA",
                                         features: "\u{29BF} 4 pathway & 3 certificate options\n\n\u{29BF} Local tech field trips\n\n\u{29BF} Field trips to Silicon Valley & Silicon Beach\n\n\u{29BF} Clubs: SB Makers, Girls Who Code, Game Development\n\n\u{29BF} Job shadows, Internships\n\n\u{29BF} Hackathon\n\n\u{29BF} Summer camp teacher positions\n\n\u{29BF} Industry lunch speakers\n\n\u{29BF} Community-building events (e.g. Taco Lunch, Year End Banquet)",
                                         courses: "\u{29BF} Exploring Computer Science\n\n\u{29BF} Computational Art\n\n\u{29BF} AP Computer Science\n\n\u{29BF} Designing Software for the Web\n\n\u{29BF} Mobile Programming Honors",
                                         socialMedia: "insta:csatsbhs,fb:sbhscomputerscienceacademy",
                                         donationLink: "https://sbhscs.org/support/#waystogive")))
        
        // Theatre
        self.progs.append(
            ProgStruct(programName: "Theatre",
                       expandedName: "SBHS Dramatic Theatre Arts",
                       type: "Act",
                       logo: "TheatreLogoAlt",
                       bigLogo: "TheatreBigLogo",
                       background: "TheatreBack",
                       statement: "\"Leap, and a net will appear.\"",
                       director: SPStaffMember(imageName: "baldridge", name: "Justin Baldridge", title: "Director", email: "jbaldridge@sbunified.org"),
                       SPStaffMembers: [],
                       miscInfo: Pathway(name: "Theatre",
                                         features: "\u{29BF} Three amazing productions per year!",
                                         courses: "\u{29BF} Theater Arts 1\n\n\u{29BF} Theater Arts Advanced\n\n\u{29BF} Stagecraft\n\n\u{29BF} Play Production",
                                         socialMedia: "insta:sbhstheater,fb:SBHSDonsTheatre",
                                         donationLink: "http://www.sbhstheatre.com/new-page/")))
        
        // Vada
        self.progs.append(
            ProgStruct(programName: "VADA",
                       expandedName: "Visual Art and Design Academy",
                       type: "Acad",
                       logo: "VADALogo",
                       bigLogo: "VADALogo",
                       background: "VADABack",
                       statement: "\"Art Saves Lives\"",
                       director: SPStaffMember(imageName: "barnett", name: "Daniel Barnett", title: "Director", email: "danielbarnett@sbunified.org"),
                       SPStaffMembers: [SPStaffMember(imageName: "nbarr", name: "Nicole Barr", title: "Instructor", email: "nbarr@sbunified.org"),
                                        SPStaffMember(imageName: "teris", name: "Brandon Teris", title: "Instructor", email: "bteris@sbunified.org")],
                       miscInfo: Pathway(name: "VADA",
                                         features: "\u{29BF} Field Trips\n\n\u{29BF} Monthly Student Lunches\n\n\u{29BF} Guest Speakers\n\n\u{29BF} First Thursday Events\n\n\u{29BF} Parent Happy Hours\n\n\u{29BF} New York City  Trip\n\n\u{29BF} Spring Show\n\n\u{29BF} VADA Prom\n\n\u{29BF} The VADA Draw\n\n\u{29BF} VADA Graduation",
                                         courses: "\u{29BF} Freehand Drawing\n\n\u{29BF} Graphic Design Basics\n\n\u{29BF} Advanced Freehand Drawing\n\n\u{29BF} Digital Imaging 1\n\n\u{29BF} Introduction to Photography\n\n\u{29BF} Advanced Painting\n\n\u{29BF} AP Studio Art",
                                         socialMedia: "insta:vadasbhs,fb:vadasbhs",
                                         donationLink: "https://www.vadasbhs.org/annual-campaign")))
        
        // MAD
        self.progs.append(
            ProgStruct(programName: "MAD",
                       expandedName: "Multimedia Art and Design Academy",
                       type: "Acad",
                       logo: "MADLogo",
                       bigLogo: "MADLogo",
                       background: "MADBack",
                       statement: "\"Digital Storytelling, Beyond Traditional Student Work\"",
                       director: SPStaffMember(imageName: "henning", name: "Henning/Peinado", title: "Co-Director", email: "ajhenning@sbunified.org"),
                       SPStaffMembers: [SPStaffMember(imageName: "peinado", name: "Shea Peinado", title: "Co-Director", email: "speinado@sbunified.org")],
                       miscInfo: Pathway(name: "MAD",
                                         features: "\u{29BF} Mexico community service trip",
                                         courses: "\u{29BF} Survey of Multimedia Applications\n\n\u{29BF} Digital Imaging 1\n\n\u{29BF} Digital Drawing\n\n\u{29BF} Social Networking/Social Media\n\n\u{29BF} Introduction to Photography\n\n\u{29BF} Non-linear Editing\n\n\u{29BF} Film and Video Production 1\n\n\u{29BF} Senior course determined by students",
                                         socialMedia: "insta:sbmadacad,fb:sbmadacad",
                                         donationLink: "http://madacad.com/donate/")))
        
        // Sport Med
        self.progs.append(
            ProgStruct(programName: "Sports Med",
                       expandedName: "Sports Medicine Pathway",
                       type: "Path",
                       logo: "SportsMedLogo",
                       bigLogo: "SportsMedLogo",
                       background: "SportsMedBack",
                       statement:"\"Health Care For Life & Sports\"",
                       director: SPStaffMember(imageName: "mrivera", name: "Maria Rivera", title: "Director", email: "merivera@sbunified.org"),
                       SPStaffMembers: [SPStaffMember(imageName: "unknown", name: "Lauren Galvin", title: "Instructor", email: "lgalvin@sbunified.org"),
                                        SPStaffMember(imageName: "cornelius", name: "Ashley Cornelius", title: "Instructor", email: "acornelius@sbunified.org")],
                       miscInfo: Pathway(name: "SportsMed",
                                         features: "\u{29BF} Practical Experience at Athletic Events\n\n\u{29BF} CPR/AED/First Aid Certification\n\n\u{29BF} Blood Borne Pathogens Certification\n\n\u{29BF} HIPAA Training Certificate\n\n\u{29BF} CDC Heads Up to Youth Sports Online Concussion Training",
                                         courses: "\u{29BF} Medical Chemistry\n\n\u{29BF} Medical Biology\n\n\u{29BF} Kinesiology\n\n\u{29BF} Sports Medicine\n\n\u{29BF} Sports Med Community (Internship)",
                                         socialMedia: "insta:sbhs_sportsmed,fb:sbhsdons",
                                         donationLink: "https://www.foundationforsbhs.org/")))
        
        // Construction Tech
        self.progs.append(
        ProgStruct(programName: "Construction",
            expandedName: "Construction Technology",
            type: "Path",
            logo: "SBHSLogo",
            bigLogo: "SBHSLogo",
            background: "constructionBack",
            statement: "\"Building the Future\"",
            director: SPStaffMember(imageName: "chadwick", name: "Caleb Chadwick", title: "Director", email: "cchadwick@sbunified.org"),
            SPStaffMembers: [],
            miscInfo: Pathway(name: "Construction",
                              features: "\u{29BF} ",
                              courses: "\u{29BF} Construction Technology 1\n\n\u{29BF} Construction Technology 2",
                              socialMedia: "insta:sbhswoodshop,fb:sbhsdons",
                              donationLink: "https://www.foundationforsbhs.org/")))
      
        // Instrumental Music
        self.progs.append(
            ProgStruct(programName: "Music",
                expandedName: "Instrumental Music",
                type: "Act",
                logo: "SBHSLogo",
                bigLogo: "SBHSLogo",
                background: "bandBack",
                statement: "\"100+ Years of Music and Tradition\"",
                director: SPStaffMember(imageName: "aguilera", name: "Dylan Aguilera", title: "Director", email: "daguilera@sbunified.org"),
                SPStaffMembers: [],
                miscInfo: Pathway(name: "Instrumental Music",
                                  features: "\u{29BF} Band\n\n\u{29BF} Orchestra\n\n\u{29BF} Drumline",
                                  courses: "\u{29BF} Jazz Ensemble Beginning\n\n\u{29BF} Jazz Ensemble Advanced\n\n\u{29BF} Orchestra\n\n\u{29BF} Drumline\n\n\u{29BF} Concert Band\n\n\u{29BF} Marching Band",
                                  socialMedia: "insta:sbhs_instrumentalmusic,fb:SBHS-Instrumental-Music-233479996808545",
                                  donationLink: "https://www.foundationforsbhs.org/")))
        
        // Choir
        self.progs.append(
        ProgStruct(programName: "Choir",
            expandedName: "SBHS Choir",
            type: "Act",
            logo: "choirLogo",
            bigLogo: "choirLogo",
            background: "choirBack",
            statement: "\"Sing Your Heart Out!\"",
            director: SPStaffMember(imageName: "laface", name: "Mary LaFace", title: "Director", email: "mlaface@sbunified.org"),
            SPStaffMembers: [],
            miscInfo: Pathway(name: "Choir",
                              features: "\u{29BF} ",
                              courses: "\u{29BF} Vocal Ensemble\n\n\u{29BF} A Cappella\n\n\u{29BF} Madrigals",
                              socialMedia: "insta:sbhschoir,fb:Santa-Barbara-High-School-Choral-Department-590063691128458",
                              donationLink: "https://www.foundationforsbhs.org/")))
        
        
        // Dance
        self.progs.append(
        ProgStruct(programName: "Dance",
            expandedName: "SBHS Dance",
            type: "Act",
            logo: "SBHSLogo",
            bigLogo: "SBHSLogo",
            background: "danceBack",
            statement: "\"Create. Dance. Live.\"",
            director: SPStaffMember(imageName: "goldman", name: "Beth Goldman", title: "Director", email: "bgoldman@sbunified.org"),
            SPStaffMembers: [],
            miscInfo: Pathway(name: "Dance",
                              features: "\u{29BF} ",
                              courses: "\u{29BF} Dance 1\n\n\u{29BF} Dance 2\n\n\u{29BF} Dance Production\n\n\u{29BF} Dance Team",
                              socialMedia: "insta:dancesbhs,fb:sbhsdons",
                              donationLink: "https://www.foundationforsbhs.org/")))
         
         // Culinary
         self.progs.append(
         ProgStruct(programName: "Culinary",
             expandedName: "Culinary Arts",
             type: "Path",
             logo: "SBHSLogo",
             bigLogo: "SBHSLogo",
             background: "culinaryBack",
             statement: "\"One of the very nicest things about life is the way we must regularly stop whatever it is we are doing and devote our attention to eating.\"\n\n– Luciano Pavarotti",
             director: SPStaffMember(imageName: "agott", name: "Ann Gott", title: "Director", email: "agott@sbunified.org"),
             SPStaffMembers: [],
             miscInfo: Pathway(name: "Culinary Arts",
                               features: "\u{29BF} ",
                               courses: "\u{29BF} Culinary Arts 1\n\n\u{29BF} Culinary Arts 2",
                               socialMedia: "insta:sbhsculinaryarts,fb:sbhsdons",
                               donationLink: "https://www.foundationforsbhs.org/")))
        
        // AVID
        self.progs.append(
        ProgStruct(programName: "AVID",
            expandedName: "SBHS AVID",
            type: "Act",
            logo: "avidLogo",
            bigLogo: "avidLogo",
            background: "avidBack",
            statement: "\"Changing the future...one student at a time.\"",
            director: SPStaffMember(imageName: "velasco", name: "Joseph Velasco", title: "Director", email: "jvelasco@sbunified.org"),
            SPStaffMembers: [
             SPStaffMember(imageName: "cortes", name: "Edith Cortes", title: "AVID/PEAC Counselor", email: "ecortes@sbunified.org"),
             SPStaffMember(imageName: "calles", name: "Veronica Calles", title: "Instructor", email: "vcalles@sbunified.org"),
             SPStaffMember(imageName: "daniel", name: "Helen Daniel", title: "Instructor", email: "hdaniel@sbunified.org"),
             SPStaffMember(imageName: "quinn", name: "Genevieve Quinn", title: "Instructor", email: "gquinn@sbunified.org")],
            miscInfo: Pathway(name: "AVID",
                              features: "\u{29BF} ",
                              courses: "\u{29BF} AVID 9\n\n\u{29BF} AVID 10\n\n\u{29BF} AVID 11\n\n\u{29BF} AVID 12",
                              socialMedia: "insta:sbhsdons,fb:sbhsdons",
                              donationLink: "https://www.foundationforsbhs.org/")))
    */
        
    }
}

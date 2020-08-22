//
//  File.swift
//  OliveGoldMasterView
//
//  Created by Nathan on 1/8/20.
//  Copyright © 2020 NateLabs. All rights reserved.
//

import Foundation

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
    
    init() {
        // NEED DANCE, CONSTRUCTION, CHOIR, BAND!!!
        
        //CSA
        self.progs.append(ProgStruct(programName: "CS Academy", expandedName: "Computer Science Academy", type: "Acad", logo: "CSALogo",  bigLogo: "CSABigLogo", background: "CSABack", statement: "The CS Academy’s mission is to expose as many SBHS students as possible to computer science and to demonstrate its relevance to their academic and career interests. Through innovative courses, opportunities outside the classroom, and industry partnerships, academy students will expand their knowledge and experience in computer science. This Career Technical Education (CTE) program will prepare students to pursue a career in this dynamic field.", director: SPStaffMember(imageName: "adams", name: "Sky Adams", title: "Director", email: "skyadams@sbunified.org"), SPStaffMembers: [SPStaffMember(imageName: "stewart", name: "Kyle Stewart", title: "Instructor", email: "kstewart@sbunified.org"), SPStaffMember(imageName: "johnston", name: "Richard Johnston", title: "Instructor", email: "rjohnston@sbunified.org"), SPStaffMember(imageName: "muhl", name: "Paul Muhl", title: "Instructor", email: "pmuhl@sbunified.org")], miscInfo: Pathway(name: "CSA", fieldTrips: "During the academic year, the CS Academy offers field trips to visit local companies and interact with programmers, software designers, engineers and other industry professionals. These field trips are offered for individual computer science classes and for the CS Academy as a whole. In past years, students have visited AppFolio, QAD, Sonos, Allosphere/MAT lab, UCSB, Procore and more!", pathways: "The Art & Design Pathway consists of two CS courses (Computational Art and Designing Software for the Web) and at least one additional elective art class offered at SBHS (e.g., Photography, Free Hand Drawing, Sculpture, Theater, etc.). To complete the pathway students also need to attend at least 4 CS Academy lunch talks in two years. The Web Design Pathway consists of two CS courses (Exploring Computer Science and Designing Software for the Web). To complete the pathway students also need to attend at least 4 CS Academy lunch talks in two years. The Elementary Developer Pathway consists of two CS courses (Exploring Computer Science and AP Computer Science). Note that students who elect this pathway should be enrolled in compaction math. To complete the pathway students also need to attend at least 4 CS Academy lunch talks in two years. The Java Developer Pathway consists of two CS courses (Computational Art and AP Computer Science). The emphasis of this pathway is on object-oriented design. Note that students who elect this pathway should be enrolled in compaction math. To complete the pathway students also need to attend at least 4 CS Academy lunch talks in two years.", studentWork: "The Olive and Gold app is an excellent example of the type of project that CSA students at SBHS do. You can download the project free on the app store", donationLink: "https://sbhscs.org/support/#waystogive")))
        
        //Theatre
        self.progs.append(ProgStruct(programName: "Theatre", expandedName: "SBHS Dramatic Theatre Arts", type: "Act", logo: "TheatreLogoAlt", bigLogo: "TheatreBigLogo", background: "TheatreBack", statement: "\"Leap, and a net will appear.\"", miscInfo: Pathway(name: "Theatre", fieldTrips: "Data Missing", pathways: "Data Missing", studentWork: "Theatre at Santa Barbara High School has been performed continuously for 114 years, 96 of those years in the same space.  We are a public high school in Santa Barbara, California, and we are dedicated to giving as professional an experience to student actors and technicians as is possible--to that end, we employ professional designers, choreographers, musical directors and guest artists.  We have become a musical theatre school, producing solely musicals in our season. SBHS Theatre is a proud part of the SBHS Performing Arts Department, which currently offers four theatre classes with Department Chair, Otto Layman, four choral music classes (including award-winning A Capella and Madrigal Singers) under the direction of Mary LaFace, four instrumental music classes (including a nationally-recognized Jazz Band under the direction of Dylan Aguilera), and five dance classes (Beth Goldman).  We offer an array of entertainment all year round, in a renovated, 800 seat house featuring state of the art lighting and sound. ", donationLink: "https://webstores.activenetwork.com/school-software/sbhs_dons_asb_online/index.php?l=product_detail&p=507#.W6vToqeZNQI")))
        
        //Vada
        self.progs.append(ProgStruct(programName: "VADA", expandedName: "Visual Art and Design Academy", type: "Acad", logo: "VADALogo", bigLogo: "VADALogo", background: "VADABack", statement: "The Visual Arts and Design Academy (VADA) is a unique \"school-within-a-school\" that integreates rigorous academic coursework with project-based, career-focused art and design instruction, in a supportive and creative environment.", miscInfo: Pathway(name: "VADA", fieldTrips: "Data Missing", pathways: "VADA Classes by grade level include: (“CP” signifies “College Prep” and “AP” signifies “Advanced Placement”)--9th: VADA Freehand Drawing--College Prep Pathway: English 9 CP--AP Pathway: English 9 Honors--10th: VADA Freehand Drawing Advanced/Intro to Graphic Design (SBCC Dual Enrollment)--College Prep Pathway: English 10 CP + World History CP + Biology CP--AP Pathway: English 10 Honors + AP World History + Chem. Honors--11th: VADA Advanced Painting/Digital Imaging I (SBCC Dual Enrollment)--College Prep Pathway: English 11 + US History + Marine Biology--AP Pathway: AP English Language + AP US History + AP Environmental Science--12th: VADA AP Studio Art or Honors Studio Art--American Government/Economics CP and/or AP English Literature", studentWork: "Key components of the Academy model are:CURRICULUM focused on a career theme and coordinated with related academic classes.VOLUNTARY student selection process that identifies interested ninth graders.TEAM OF TEACHERS who work together to plan and implement the program.MOTIVATIONAL ACTIVITIES with private sector involvement to encourage academic and occupational preparation, such as: integrated and project-based curriculum, mentor program, classroom speakers, field trips, and exploration of post-secondary and career options.WORKPLACE LEARNING OPPORTUNITIES such as job shadowing, student internships, and work experience.", donationLink: "https://www.vadasbhs.org/")))
        
        //MAD
        self.progs.append(ProgStruct(programName: "MAD", expandedName: "Multimedia Art and Design Academy", type: "Acad", logo: "MADLogo", bigLogo: "MADLogo", background: "MADBack", statement: "The MAD Academy is a four year \"school within a school\" at Santa Barbara High School. Stuents take an integrated curriculum comprissed of pre-AP, Honors & AP level academic requirements & college classes in Graphic Design, Film, Photography, Socia Media & Web Design.", miscInfo: Pathway(
        name: "MAD"
        , fieldTrips: "MEXICO COMMUNITY SERVICE TRIP:The MAD Community Service Trip has been described by students as “life changing” and that it “opened their eyes” to how some people in this world live. The families that receive homes have their lives transformed through being provided the basic need of shelter. Students will receive community service hours for attending but they also gain so much more. Students come home with a better appreciation for the life they have in Santa Barbara."
        , pathways: "As an academy, MAD offers an integrated curriculum. As such, MAD students will take the majority of the core academic classes with their fellow MAD students, providing a level of comfort and continuity. Furthermore, to keep the level of student interest high, many core academic assignments will involve/require media based deliverables. MAD students are very well prepared to succeed in college. With a minimum of 24 units of college credit in addition to a varying number of APs, MAD students often enter their college experience with more than a full year of college-level credits. This accelerated curriculum allows many students to graduate in three or fewer years – which represents potential savings of tens of thousands of dollars depending on which schools students attend."
        , studentWork: "Student Work Page http://madacad.com/work/"
        , donationLink: "http://madacad.com/donate/")))
        
        //Sport Med
        self.progs.append(ProgStruct(programName: "Sports Med", expandedName: "Sports Medicine Pathway", type: "Path", logo: "SportsMedLogo", bigLogo: "SportsMedLogo", background: "SportsMedBack", statement:"Our pathway intent is to build upon student interests by expanding their knowledge and their skill set to excel in the post high school course work necessary for their career goals.", miscInfo: Pathway(name: "SportsMed", fieldTrips: "Data Missing", pathways: "Medical Chemistry:A great introduction to basic chemical properties and processes as related to the human body, health, and medical careers.  This course is perfect for students interested in a health career but not yet ready for Honors Chemistry.  Medical Chemistry will serve as a foundation for future or concurrent biology classes as well as A.P. Biology.Honors Chemistry: If you are interested in pursuing a pre-med program in college and you are strong in math you should enroll in Honors Chemistry.  You must have satisfactorily completed Honors Chemistry to enroll in A.P Chemistry.  A strong foundation in Chemistry will make your first years in a pre-med program more successful.Medical Biology:Starts with an overview of the human body and then dives into five systems in detail while incorporating basic biological principles.  If you are interested in a health career, or think that learning biology in the context of the human body sounds interesting, this is the class for you. Kinesiology: Get ready to memorize!  In this class you will explore the human body and its systems as they relate to human movement and performance.  If you are interested in pursuing a career as a health care professional or learning about human anatomy and physiology Kinesiology is the class for you. Needed to enroll in Sports Medicine.Sports Medicine: Provides an overview of: health care occupations, human anatomy, medical terminology, nutrition, physical fitness, soft tissue and bone response to trauma, emergency procedures, therapeutic modalities and exercises, and evaluation and classification of sports related injuries.  You will have the opportunity to apply what you learn in class as you rotate through on-the-job training experiences with local athletic trainers, physical therapists, chiropractors, and physical education instructors.A.P. Biology & A.P. Chemistry:If your career goal involves continuing education after high school, plan on completing at least one A.P. class to give yourself the best possible start in college.", studentWork: "Data Missing", donationLink: "https://ws0.asbworks.com/(S(xrgovbg2c1wfvma0wqrbic02))/apps/webstore/pages/WebStore.aspx?org=14935")))
        
        
        //Blank
        self.progs.append(ProgStruct())
        
        
        
    }
}
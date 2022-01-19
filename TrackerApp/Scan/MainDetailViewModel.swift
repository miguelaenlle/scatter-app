//
//  LoginViewModel.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/11/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class MainDetailViewModel: ObservableObject {
    @Published var error: Message? = nil
    @Published var loading = false
    @Published var documentData: [String: Any] = [:]
    @Published var student: Student?
    @Published var schedule: [Schedule] = []
    @Published var brownDaySchedule: [Schedule] = []
    @Published var orangeDaySchedule: [Schedule] = []
    @Published var minors: [Minor] = []
    
    @Published var currentClass: Schedule?
    @Published var periodNumber: Int?
    @Published var dayType: String?
    let db = Firestore.firestore()
    func addError(_ error: String) {
        DispatchQueue.main.async {
            withAnimation {
                self.error = Message(text: error)
                
            }
        }
    }
    func resetErrors() {
        DispatchQueue.main.async {
            withAnimation {
                self.error = nil
            }
        }
        
    }
    
    func getInformationForStudent() {
        let hour = Calendar.current.component(.hour, from: Date())
        let minute = Calendar.current.component(.minute, from: Date())
        // filter down the hour to get the period number [locally stored]
        let hrFilter = startEndTimes.filter {($0.start.hour <= hour) && ($0.end.hour >=  hour)} // get
        print(hrFilter)
        let dataFilter = hrFilter.filter {(($0.start.hour == hour) && ($0.start.minute <= minute) ) || (($0.end.hour == hour) && ($0.end.minute >= minute)) || (($0.end.hour > hour) && ($0.start.hour < hour))} // this might return 2??
        print(dataFilter)
        getDayType { dayType in
            self.dayType = dayType
        }
        if dataFilter.count > 0 {
            var periodNumber = dataFilter[0].period // pull the period
            // does this only pull for the brown day??
            
            getDayType { dayType in
                print(dayType)
                self.periodNumber = periodNumber
                self.dayType = dayType
                
                if dayType == "Orange" {
                    if dataFilter.count > 0 {
                        periodNumber = dataFilter[0].period
                    }
                } else if dayType == "Brown" {
                    if dataFilter.count > 1 {
                        periodNumber = dataFilter[1].period
                    }
                }
            }
            print("Current period:", periodNumber)
            let currentClasses = schedule.filter {$0.period == periodNumber}
            if currentClasses.count > 0 {
                self.currentClass = currentClasses[0]
            }
            
            
            
            print(periodNumber)
        }
    }
    
    func extractMinors(studentID: String) {
        let minorsReference = self.db.collection("students").document(studentID).collection("minors")
        minorsReference.getDocuments() { (querySnapshot, err) in
            if let err = err {
                self.addError(err.localizedDescription)
            } else {
                for document in querySnapshot!.documents {
                    if let title = document["title"] as? String,
                       let description = document["description"] as? String,
                       let timestamp = document["timestamp"] as? String {
                        let minor = Minor(title: title, description: description, time: timestamp)
                        self.minors.append(minor)
                        
                    }

                }
            }
        }
        
    }
    
    func regenMinors() {
        self.minors = []
        if let studentID = student?.studentID {
            extractMinors(studentID: studentID)
        }
    }
    
    func extractFullSchedule(studentID: String) {
        for dayType in ["Orange", "Brown"] {
            
            let scheduleReference = self.db.collection("students").document(studentID).collection(dayType)
            
            scheduleReference.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    self.addError(err.localizedDescription)
                } else {
                    
                    guard let documents = querySnapshot?.documents else {return}
                    for document in documents {
                        let className = document.documentID
                        if let period = document["periodNumber"] as? NSNumber,
                           let teacherEmail = document["teacherEmail"] as? String {
                            let scheduleData = Schedule(className: className, period: Int(truncating: period)+1, teacherEmail: teacherEmail) // fixed the start end time thing here
                            if (dayType == "Orange") {
                                self.orangeDaySchedule.append(scheduleData)
                            } else if (dayType == "Brown") {
                                self.brownDaySchedule.append(scheduleData)
                                
                            }
                        }

                        
                    }
                    print(self.orangeDaySchedule)
                    
                    
                    self.getInformationForStudent()
                }
            }
            
        }
    }
    
    @Published var isLoading: Bool = false
    
    func extractSchedule(studentID: String) {
        isLoading = true
        getDayType { dayType in
            print(dayType)
            if dayType != "" {
                
                let scheduleReference = self.db.collection("students").document(studentID).collection(dayType)
                scheduleReference.getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        self.addError(err.localizedDescription)
                        self.isLoading = false
                    } else {
                        guard let documents = querySnapshot?.documents else {return}
                        for document in documents {
                            let className = document.documentID
                            if let period = document["periodNumber"] as? NSNumber,
                               let teacherEmail = document["teacherEmail"] as? String {
                                let scheduleData = Schedule(className: className, period: Int(truncating: period)+1, teacherEmail: teacherEmail) // fixed the start end time thing here
                                self.schedule.append(scheduleData)
                                print(scheduleData)
                            }

                        }
                        
                        self.getInformationForStudent()
                        self.isLoading = false
                    }
                }
            } else {
                self.isLoading = false
            }
        }
    }
    
    func handleInfoChange() {
        
        if let studentID = self.student?.studentID {
            self.orangeDaySchedule = []
            self.brownDaySchedule = []
            
            self.extractFullSchedule(studentID: studentID)
        } else {
            self.addError("An error occured, please try again.")
        }
    }
    
    func processScan(scannedData: String, completion: @escaping(Bool) -> Void) {
        self.resetErrors()
        self.loading = true
        
        let userReference = db.collection("students").document(scannedData)
       
        
        userReference.getDocument { (document, error) in
            if let document = document, document.exists {
                if let documentsData = document.data() {
                    self.extractSchedule(studentID: scannedData)
                    self.extractMinors(studentID: scannedData)
                
                    self.documentData = documentsData
                    print(self.documentData)
                    
                    let studentID = document.documentID
                    
                    if let studentName = documentsData["studentName"] as? String,
                       let studentEmail = documentsData["studentEmail"] as? String {
                        self.student = Student(studentID: studentID, studentName: studentName, studentEmail: studentEmail)
                    }
                    self.handleInfoChange()
                    completion(true)
                    
                } else {
                    self.loading = false
                    self.addError("ID does not exist.")
                    completion(false)
                }
            } else {
                self.loading = false
                self.addError("ID does not exist.")
                completion(false)
            }
        }
        
        
        
        
        
    }
    
    
}

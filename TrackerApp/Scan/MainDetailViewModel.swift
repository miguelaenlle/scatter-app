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
    @Published var errors: [String] = []
    @Published var loading = false
    @Published var documentData: [String: Any] = [:]
    @Published var student: Student?
    @Published var schedule: [Schedule] = []
    @Published var minors: [Minor] = []
    
    @Published var currentClass: Schedule?
    
    
    let db = Firestore.firestore()
    func addError(_ error: String) {
        DispatchQueue.main.async {
            withAnimation {
                self.errors.append(error)
                
            }
        }
    }
    func resetErrors() {
        DispatchQueue.main.async {
            withAnimation {
                self.errors = []
                
            }
        }
        
    }
    
    func getInformationForStudent() {
        let currentDate = Date()
        let hour = Calendar.current.component(.hour, from: Date())
        let minute = Calendar.current.component(.minute, from: Date())
//        
//        let hour = 13
//        let minute = 41
        
        let hrFilter = startEndTimes.filter {($0.start.hour <= hour) && ($0.end.hour >=  hour)}
        print(hrFilter)
        let dataFilter = hrFilter.filter {(($0.start.hour == hour) && ($0.start.minute <= minute) ) || (($0.end.hour == hour) && ($0.end.minute >= minute)) || (($0.end.hour > hour) && ($0.start.hour < hour))}
        print(dataFilter)
        if dataFilter.count > 0 {
            let periodNumber = dataFilter[0].period
            // get the nth period for the student
            self.currentClass = schedule.filter {$0.period == periodNumber}[0]
            
            
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
    
    
    
    func extractSchedule(studentID: String) {
        getDayType { dayType in
            print(dayType)
            
            let scheduleReference = self.db.collection("students").document(studentID).collection(dayType)
            scheduleReference.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    self.addError(err.localizedDescription)
                } else {
                    for document in querySnapshot!.documents {
                        let className = document.documentID
                        if let period = document["periodNumber"] as? NSNumber,
                           let teacherEmail = document["teacherEmail"] as? String {
                            let scheduleData = Schedule(className: className, period: Int(period), teacherEmail: teacherEmail)
                            self.schedule.append(scheduleData)
                            print(scheduleData)
                        }

                    }
                    
                    self.getInformationForStudent()
                }
            }
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

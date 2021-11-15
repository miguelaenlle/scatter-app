//
//  TimeManager.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/14/21.
//

import SwiftUI
import FirebaseFirestore

let db = Firestore.firestore()

func fetchDayRTDBFormatForDate(date: Date) -> String {
    
    let calendar = Calendar.current
    
    let year = calendar.component(.year, from: date)
    let month = calendar.component(.month, from: date)
    let day = calendar.component(.day, from: date)
    
    let dayString = "\(month)-\(day)-\(year)"
    
    return dayString
}

func getDayType(completion: @escaping(String) -> Void) {
    // get the date
    let date = Date()
    let dateReference = db.collection("ob_days").document(fetchDayRTDBFormatForDate(date: date))
//    completion("Orange")
    dateReference.getDocument { (document, error) in
         if let document = document, document.exists {
             if let documentsData = document.data() {
                 print(documentsData)
                 if let dayType = documentsData["dayType"] as? String {
                     completion(dayType.capitalized())
                 } else {
                     completion("")
                 }
             } else {
                 completion("")
             }
        } else {
            completion("")

        }
     }

}

func getCurrentPeriod() -> Int {
    
    return 0
    
}

//
//  Schedule.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/14/21.
//

import Foundation

struct Schedule: Identifiable, Hashable {
    var id = UUID()
    var className: String
    var period: Int
    var teacherEmail: String
    
}

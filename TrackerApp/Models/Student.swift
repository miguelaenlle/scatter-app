//
//  Student.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/14/21.
//

import SwiftUI

struct Student: Identifiable, Hashable {
    var id = UUID()
    var studentID: String
    var studentName: String
    var studentEmail: String
}

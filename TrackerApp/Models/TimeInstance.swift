//
//  TimeInstance.swift
//  TrackerApp
//
//  Created by Pink Flamingo on 11/14/
//

import Foundation

struct TimeInstance: Identifiable, Hashable {
    var id = UUID()
    var hour: Int
    var minute: Int
    
}
struct StartEndTime: Identifiable, Hashable {
    var id = UUID()
    var period: Int
    var start: TimeInstance
    var end: TimeInstance
}


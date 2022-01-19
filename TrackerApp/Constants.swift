//
//  Constants.swift
//  ScheduleApp
//
//  Created by Miguel Aenlle on 5/27/21.
//

import SwiftUI

let lightOrange = Color(#colorLiteral(red: 0.8980392157, green: 0.5843137255, blue: 0.1333333333, alpha: 1))
let darkOrange = Color(#colorLiteral(red: 1, green: 0.4901960784, blue: 0.1294117647, alpha: 1))
let lightBrown = Color(#colorLiteral(red: 0.7058823529, green: 0.5254901961, blue: 0.1882352941, alpha: 1))



let darkOrangeSemiTransparent = darkOrange.opacity(0.5)

let orangeGradient = Gradient(colors: [lightOrange, darkOrange])
let whiteToOrangeGradient = Gradient(colors: [Color.white, lightOrange])
let brownGradient = Gradient(colors: [lightBrown, darkOrange])
let grayGradient = Gradient(colors: [midGray, darkGray])
let whiteGradient = Gradient(colors: [Color.white, Color.white])


let orangeLinearGradient = LinearGradient(gradient: orangeGradient,
                                          startPoint: .top,
                                          endPoint: .bottom)
let whiteLinearGradient = LinearGradient(gradient: whiteGradient,
                                          startPoint: .top,
                                          endPoint: .bottom)
let brownLinearGradient = LinearGradient(gradient: brownGradient,
                                         startPoint: .top,
                                         endPoint: .bottom)
let grayLinearGradient = LinearGradient(gradient: grayGradient,
                                         startPoint: .top,
                                         endPoint: .bottom)
let orangeWhiteLinearGradient = LinearGradient(gradient: whiteToOrangeGradient,
                                          startPoint: .leading,
                                          endPoint: .trailing)
let black: Color = .black
let blackShadow = black.opacity(0.3)
let gray: Color = Color(#colorLiteral(red: 0.8822566867, green: 0.8824083805, blue: 0.8822471499, alpha: 1))
let darkGray: Color = Color(#colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1))

let backgroundGray: Color = Color(#colorLiteral(red: 0.9843137255, green: 0.968627451, blue: 0.9568627451, alpha: 1))
let midGray: Color = Color(#colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1))

struct FontSizes {
    let large: CGFloat = 24.0
    let medium: CGFloat = 15.0
    let midsmall: CGFloat = 14.0
    let small: CGFloat = 12.0
}


let customFont = "SF Pro Display"
let brandName = "TidyNote for D214"

let tasksString = "🎯  Tasks"
let scheduleString = "📅  Schedule"
let starredString = "⭐️  Starred Students"
let allString = "🎓  All Students"

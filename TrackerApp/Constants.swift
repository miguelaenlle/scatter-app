//
//  Constants.swift
//  ScheduleApp
//
//  Created by Miguel Aenlle on 5/27/21.
//

import SwiftUI

let lightOrange = Color(#colorLiteral(red: 0.937254902, green: 0.6941176471, blue: 0.3098039216, alpha: 1))
let darkOrange = Color(#colorLiteral(red: 0.9254901961, green: 0.4117647059, blue: 0.1764705882, alpha: 1))
let lightBrown = Color(#colorLiteral(red: 0.7223111987, green: 0.3968755603, blue: 0.2101789117, alpha: 1))



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
let darkGray: Color = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))

let backgroundGray: Color = Color(#colorLiteral(red: 0.8705882353, green: 0.8705882353, blue: 0.8705882353, alpha: 1))
let midGray: Color = Color(#colorLiteral(red: 0.6770948457, green: 0.6770948457, blue: 0.6770948457, alpha: 1))


struct FontSizes {
    let large: CGFloat = 24.0
    let medium: CGFloat = 15.0
    let midsmall: CGFloat = 14.0
    let small: CGFloat = 12.0
}


let customFont = "Avenir"
let brandName = "TidyNote for D214"

let tasksString = "🎯  Tasks"
let scheduleString = "📅  Schedule"
let starredString = "⭐️  Starred Students"
let allString = "🎓  All Students"

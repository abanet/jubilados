//
//  Settings.swift
//  Jubilator
//
//  Created by Alberto Banet Masa on 29/5/24.
//

import SwiftUI

class Settings: ObservableObject {
    @AppStorage("colorTheme") var colorTheme: String = "Blue"
    @AppStorage("timeFormat") var timeFormat: String = "Detailed"
    
    static let colorOptions = ["Blue", "Green", "Red"]
    static let timeFormatOptions = ["Detailed", "Simple"]
    
    func getThemeColors() -> ThemeColors {
           switch colorTheme {
           case "Blue":
               return ThemeColors(primary: Color.blue, secondary: Color.blue.opacity(0.7), accent: Color.blue.opacity(0.5))
           case "Green":
               return ThemeColors(primary: Color.green, secondary: Color.green.opacity(0.7), accent: Color.green.opacity(0.5))
           case "Red":
               return ThemeColors(primary: Color.red, secondary: Color.red.opacity(0.7), accent: Color.red.opacity(0.5))
           default:
               return ThemeColors(primary: Color.blue, secondary: Color.blue.opacity(0.7), accent: Color.blue.opacity(0.5))
           }
       }
}

struct ThemeColors {
    let primary: Color
    let secondary: Color
    let accent: Color
}

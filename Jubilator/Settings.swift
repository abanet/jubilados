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
}


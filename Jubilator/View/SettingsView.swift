//
//  SettingsView.swift
//  Jubilator
//
//  Created by Alberto Banet Masa on 29/5/24.
//
import SwiftUI

struct SettingsView: View {
    @ObservedObject var settings: Settings

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Color Theme")) {
                    Picker("Color Theme", selection: $settings.colorTheme) {
                        ForEach(Settings.colorOptions, id: \.self) { color in
                            Text(color)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Time Format")) {
                    Picker("Time Format", selection: $settings.timeFormat) {
                        ForEach(Settings.timeFormatOptions, id: \.self) { format in
                            Text(format)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("Settings")
        }
    }
}


#Preview {
    SettingsView(settings: Settings())
}


//
//  ContentView.swift
//  Jubilator
//
//  Created by Alberto Banet Masa on 29/5/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = JubilacionViewModel()
    @State private var showingAddPersonView = false
    @State private var showingSettingsView = false
    @StateObject private var settings = Settings()

    var body: some View {
        NavigationView {
            ZStack {
                    List {
                        ForEach(viewModel.people) { person in
                            CeldaJubilacion(settings: settings, persona: person)
                        }
                        .onDelete(perform: viewModel.removePerson)
                    }
            }
            
            .navigationTitle("Jubilator")
            .navigationBarItems(leading: Button(action: {
                            showingSettingsView = true
                        }) {
                            Image(systemName: "gear")
                        }, trailing: Button(action: {
                            showingAddPersonView = true
                        }) {
                            Image(systemName: "plus")
                        })
                        .sheet(isPresented: $showingSettingsView) {
                            SettingsView(settings: settings)
                        }
                        .sheet(isPresented: $showingAddPersonView) {
                            AddPersonView(viewModel: viewModel)
                        }
        }
    }

    
}



#Preview {
    ContentView()
}



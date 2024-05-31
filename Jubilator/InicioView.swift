//
//  ContentView.swift
//  Jubilator
//
//  Created by Alberto Banet Masa on 29/5/24.
//

import SwiftUI

import SwiftUI

struct InicioView: View {
    @StateObject private var viewModel = JubilacionViewModel()
    @State private var showingAddPersonView = false
    @State private var showingSettingsView = false
    @StateObject private var settings = Settings()

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
            
                VStack {
                    List {
                            ForEach(viewModel.people) { person in
                                CeldaJubilacion(settings: settings, persona: person).listRowBackground(Color.clear)
                            }
                            .onDelete(perform: viewModel.removePerson)
                    }
                    .listStyle(PlainListStyle())
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

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [.blue, .yellow,.green], startPoint: .topLeading, endPoint: .bottomTrailing)
            .opacity(0.4)
            .ignoresSafeArea()
    }
}


#Preview {
    InicioView()
}





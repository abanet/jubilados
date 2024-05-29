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

    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    List {
                        ForEach(viewModel.people) { person in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(person.nombre)
                                        .font(.headline)
                                    Text(formattedDate(person.fechaJubilacion))
                                        .font(.subheadline)
                                    CountdownView(targetDate: person.fechaJubilacion)
                                        .padding(.top, 5)
                                }
                                .background(Color.clear)
                                .padding(.vertical, 10)
                            }
                            .background(Color.clear) // Fondo claro para cada celda
                        }
                        .onDelete(perform: viewModel.removePerson)
                    }
                }
            }
            
            .navigationTitle("Jubilator")
            .navigationBarItems(trailing: Button(action: {
                showingAddPersonView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddPersonView) {
                AddPersonView(viewModel: viewModel)
            }
        }
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}



#Preview {
    ContentView()
}

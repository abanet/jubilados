//
//  AddPersonView.swift
//  Jubilator
//
//  Created by Alberto Banet Masa on 29/5/24.
//

import SwiftUI

struct AddPersonView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: JubilacionViewModel
    @State private var nombre: String = ""
    @State private var fecha: Date = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nombre")) {
                    TextField("Nombre", text: $nombre)
                }
                Section(header: Text("Fecha de Jubilación")) {
                    DatePicker("Fecha de Jubilación", selection: $fecha, displayedComponents: .date)
                }
            }
            .navigationTitle("Nuevo Trabajador")
            .navigationBarItems(trailing: Button("Save") {
                viewModel.addPerson(nombre: nombre, fechaJubilacion: fecha)
                presentationMode.wrappedValue.dismiss()
            })
        }
        
    }
}

#Preview {
    AddPersonView(viewModel: JubilacionViewModel())
}

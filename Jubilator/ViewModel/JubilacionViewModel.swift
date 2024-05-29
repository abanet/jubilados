//
//  JubilacionViewModel.swift
//  Jubilator
//
//  Created by Alberto Banet Masa on 29/5/24.
//

import Foundation

class JubilacionViewModel: ObservableObject {
    @Published var people: [Person] = [] {
        didSet {
            savePeople()
        }
    }

    init() {
        loadPeople()
    }

    func addPerson(nombre: String, fechaJubilacion: Date) {
        let newPerson = Person(nombre: nombre, fechaJubilacion: fechaJubilacion)
        people.append(newPerson)
    }

    func removePerson(at offsets: IndexSet) {
        people.remove(atOffsets: offsets)
    }

    private func savePeople() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: "People")
        }
    }

    private func loadPeople() {
        if let savedPeople = UserDefaults.standard.data(forKey: "People"),
           let decodedPeople = try? JSONDecoder().decode([Person].self, from: savedPeople) {
            people = decodedPeople
        }
    }
}



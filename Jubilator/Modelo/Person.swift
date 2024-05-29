//
//  Person.swift
//  Jubilator
//
//  Created by Alberto Banet Masa on 29/5/24.
//
import Foundation

struct Person: Identifiable, Codable {
    var id = UUID()
    var nombre: String
    var fechaJubilacion: Date
}

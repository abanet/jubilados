//
//  CeldaJubilacionView.swift
//  Jubilator
//
//  Created by Alberto Banet Masa on 29/5/24.
//
import SwiftUI

struct CeldaJubilacion: View {
    @ObservedObject var settings: Settings
    var persona: Person

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(persona.nombre)
                    .font(.headline)
                    .foregroundColor(settings.getThemeColors().primary)
                Text(formattedDate(persona.fechaJubilacion))
                    .font(.subheadline)
                HStack {
                    Spacer()
                    CountdownView(targetDate: persona.fechaJubilacion, settings: settings)
                }
            }
        }
    }
}

func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: date)
}


#Preview {
    CeldaJubilacion(settings: Settings(), persona: Person(nombre: "Alberto", fechaJubilacion: Date()))
}

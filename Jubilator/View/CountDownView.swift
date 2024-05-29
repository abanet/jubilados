//
//  CountDownView.swift
//  Jubilator
//
//  Created by Alberto Banet Masa on 29/5/24.
//
import SwiftUI


struct CountdownView: View {
    var targetDate: Date
    @State private var remainingTime: String = ""
    
    var body: some View {
        Text(remainingTime)
            .font(.system(.body, design: .monospaced)) // Usa una fuente monoespaciada
            .frame(minWidth: 250, alignment: .trailing) // Ajusta el ancho mínimo del cuadro de texto
            .onAppear(perform: updateRemainingTime)
            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                updateRemainingTime()
            }
            .background(Color.esperanza)
    }
    
    func updateRemainingTime() {
        let now = Date()
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.year, .day, .hour, .minute, .second], from: now, to: targetDate)
        
        if let years = components.year, let days = components.day, let hours = components.hour, let minutes = components.minute, let seconds = components.second {
            let totalDays = calendar.dateComponents([.day], from: now, to: targetDate).day ?? 0
            let yearsFromDays = totalDays / 365
            let daysRemaining = totalDays % 365
            
            remainingTime = String(format: "%02da %03dd %02dh %02dm %02ds", yearsFromDays, daysRemaining, hours, minutes, seconds)
        } else {
            remainingTime = "Time's up!"
        }
    }
}

#Preview {
    CountdownView(targetDate: Date())
}

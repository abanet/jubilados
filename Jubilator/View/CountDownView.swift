//
//  CountDownView.swift
//  Jubilator
//
//  Created by Alberto Banet Masa on 29/5/24.
//
import SwiftUI


struct CountdownView: View {
    var targetDate: Date
    @ObservedObject var settings: Settings
    @State private var remainingTime: String = ""
    @State private var progress: Double = 1.0
    
    var body: some View {
        VStack {
            Text(remainingTime)
                .font(.system(.body, design: .monospaced))
                .frame(minWidth: 250, alignment: .trailing) 
                .onAppear(perform: updateRemainingTime)
                .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                    updateRemainingTime()
                }
            ProgressView(value: progress)
                           .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                           .frame(height: 10)
                           
        }
    }
    
    
    func updateRemainingTime() {
        let now = Date()
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now, to: targetDate)
        
        var timeStrings: [String] = []
        
        if let years = components.year, let months = components.month, let days = components.day, let hours = components.hour, let minutes = components.minute, let seconds = components.second {
            if years > 0 {
                timeStrings.append("\(years) año\(years > 1 ? "s" : "")")
            }
            
            if years > 0 || months > 0 {
                timeStrings.append("\(months) mes\(months > 1 ? "es" : "")")
            }
            
            if years > 0 || months > 0 || days > 0 {
                timeStrings.append("\(days) día\(days > 1 ? "s" : "")")
            }
            
            if years > 0 || months > 0 || days > 0 || hours > 0 {
                timeStrings.append("\(hours) hora\(hours > 1 ? "s" : "")")
            }
            
            if years > 0 || months > 0 || days > 0 || hours > 0 || minutes > 0 {
                timeStrings.append("\(minutes) minuto\(minutes > 1 ? "s" : "")")
            }
            
            timeStrings.append("\(seconds) segundo\(seconds > 1 ? "s" : "")")
            
            remainingTime = timeStrings.joined(separator: ", ")
            // Calcular el progreso
            let totalYears = 10.0 // más de 10 asumimos un 100%, queda mucho
            let yearsRemaining = Double(years) + (Double(months) / 12.0)
            progress = 1.0 - min(1.0, yearsRemaining / totalYears)
        } else {
            remainingTime = "¡Tiempo agotado!"
            progress = 0
        }
    }

}

#Preview {
    CountdownView(targetDate: Date(), settings: Settings())
}

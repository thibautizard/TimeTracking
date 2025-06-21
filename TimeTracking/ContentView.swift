//
//  ContentView.swift
//  TimeTracking
//
//  Created by Thibaut Izard on 20/06/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var elapsedTime: TimeInterval = 0
    @State private var timerRunning = false
    @State private var timer: Timer?
    
    
    var body: some View {
        VStack(spacing:30) {
            Text("Time tracking")
                .font(.largeTitle)
                .bold()
            
            Text(formattedTime(elapsedTime))
                .font(.system(size: 48, weight: .medium, design: .monospaced))
                .padding()
            HStack(spacing: 40) {
                Button("Start timer") {
                    start()
                }
                .padding()
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.blue, in: RoundedRectangle(cornerRadius: 8))
                .disabled(timerRunning)
                .opacity(timerRunning ? 0.5 : 1)
                Button("Stop timer") {
                    stop()
                }.disabled(!timerRunning)
            }
            Button("Reset") {
                reset()
            }
            .font(.system(size: 16, weight: .bold))
            .padding()
            .foregroundColor(Color.white)
            .background(Color.red, in: RoundedRectangle(cornerRadius: 8))
            .opacity(timerRunning || elapsedTime == 0 ? 0.5 : 1)
            .shadow(color: timerRunning || elapsedTime == 0 ? .clear : .gray , radius: 5, x: 0, y: 2)
            .disabled(timerRunning)
        }
        
    }
    
    
    // Functions
    
    func formattedTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format:"%02d:%02d", minutes, seconds)
    }
    
    func start() {
       
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            elapsedTime += 1
        }
    }
    
    func stop() {
        timer?.invalidate()
        timerRunning = false
    }
    
    func reset() {
        timer?.invalidate()
        elapsedTime = 0
        timer = nil
        timerRunning = false
    }

}

#Preview {
    ContentView()
}

import Foundation

struct Activity: Identifiable {
    let id = UUID()
    var name: String
    var timeSpent: TimeInterval = 0.0
}

extension TimeInterval {
    func formatted() -> String {
        let hours = Int(self) / 3600
        let minutes = Int(self) / 60 % 60
        let seconds = Int(self) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
}

let defaultActivities: [Activity] = [
    Activity(name: "Activité 1"),
    Activity(name: "Activité 2"),
    Activity(name: "Activité 3"),
]

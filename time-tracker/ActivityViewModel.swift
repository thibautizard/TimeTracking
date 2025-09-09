import Foundation
import Combine

class ActivityViewModel: ObservableObject {
    
    @Published var activities: [Activity]
    
    private var timer: AnyCancellable?
    private var currentActivityID: UUID?
    private var startTime: Date?
    
    init() {
        // Sample data
        self.activities = [
            Activity(name: "Musculation"),
            Activity(name: "Faire les courses"),
            Activity(name: "Sortir les chiens")
        ]
    }
    
    func addActivity(name: String) {
        let newActivity = Activity(name: name)
        activities.append(newActivity)
    }
    
    func toggleTracking(for activity: Activity) {
        if activity.id == currentActivityID {
            stopTracking()
        } else {
            stopTracking()
            startTracking(for: activity)
        }
    }
    
    private func startTracking(for activity: Activity) {
        currentActivityID = activity.id
        startTime = Date()
        
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect().sink { [weak self] _ in
            self?.updateTime()
        }
    }

    private func updateTime() {
        guard let _ = currentActivityID,
              let startTime = startTime,
              let _ = timer,
              let  activityIndex = activities.firstIndex(where: { $0.id == currentActivityID })
        else { return }
        
        let timeElapsed = Date().timeIntervalSince(startTime)
        activities[activityIndex].timeSpent += timeElapsed
        self.startTime = Date()
    }
    
    private func stopTracking() {
        updateTime()
        timer?.cancel()
        timer = nil
        currentActivityID = nil
        startTime = nil
    }
    
    func isTracking(activity: Activity) -> Bool {
        return activity.id == currentActivityID
    }
}

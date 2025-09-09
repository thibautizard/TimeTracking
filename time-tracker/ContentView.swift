import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ActivityViewModel()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.activities) { activity in
                HStack {
                    Text(activity.name)
                    Spacer()
                    Text(activity.timeSpent.formatted()).font(.body.monospacedDigit())
                    Button {
                        viewModel.toggleTracking(for: activity)
                    } label : {
                        Image(systemName: viewModel.isTracking(activity: activity) ? "stop.circle.fill" : "play.circle.fill")
                            .foregroundColor(viewModel.isTracking(activity: activity) ? .red : .green)
                    }
                }
            }
            .navigationTitle("Time Tracker")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showingAddActivity = true
                    } label : {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivityView { newName in
                    viewModel.addActivity(name: newName)
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}

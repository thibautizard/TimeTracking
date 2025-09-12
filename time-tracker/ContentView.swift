//
//  ContentView.swift
//  time-tracker
//
//  Created by Thibaut Izard on 16/08/2025.
//

import SwiftUI

func addActivity() {
    
}

struct ContentView: View {
    
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationStack {
            List(defaultActivities) { activity in
                Text(activity.name)
            }
            .navigationTitle("Activities")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(
                        action: {
                            self.showingAddActivity = true
                        }
                    ) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivityView()
            }
        }
    }
}

#Preview {
    ContentView()
}
        

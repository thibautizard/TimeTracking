//
//  AddActivityView.swift
//  time-tracker
//
//  Created by Thibaut Izard on 12/09/2025.
//

import SwiftUI


struct AddActivityView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
               
                Text("Vue pour ajouter une activité")
            }
            .navigationTitle("Nouvelle activité")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Annuler") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Confirmer") {
                        //
                    }
                }
            }
        }
    }
}

#Preview {
    AddActivityView()
}

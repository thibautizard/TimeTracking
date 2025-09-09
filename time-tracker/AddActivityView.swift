import SwiftUI

struct AddActivityView: View {
    
    @State private var name = ""
    @Environment(\.dismiss) var dismiss
    
    var onAdd: (String) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Nom de l'activité", text: $name)
            }
            .navigationTitle("Nouvelle activité")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Annuler") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Ajouter") {
                        onAdd(name)
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}

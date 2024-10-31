import SwiftUI

struct MaintenanceItem: Identifiable {
    let id = UUID()
    let title: String
    let date: Date
    let mileage: Int
    let cost: Double
    let notes: String
}

struct MaintenanceView: View {
    @State private var maintenanceItems: [MaintenanceItem] = []
    @State private var showingAddMaintenance = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(maintenanceItems) { item in
                    MaintenanceRow(item: item)
                }
            }
            .navigationTitle("Maintenance Log")
            .toolbar {
                Button(action: { showingAddMaintenance.toggle() }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddMaintenance) {
                AddMaintenanceView()
            }
        }
    }
}

struct MaintenanceRow: View {
    let item: MaintenanceItem
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.title)
                .font(.headline)
            
            HStack {
                Image(systemName: "calendar")
                Text(dateFormatter.string(from: item.date))
                
                Spacer()
                
                Image(systemName: "speedometer")
                Text("\(item.mileage) miles")
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            
            if !item.notes.isEmpty {
                Text(item.notes)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Text("$\(String(format: "%.2f", item.cost))")
                .font(.subheadline)
                .foregroundColor(.green)
        }
        .padding(.vertical, 8)
    }
}

struct MaintenanceView_Previews: PreviewProvider {
    static var previews: some View {
        MaintenanceView()
    }
}
import SwiftUI

struct Motorcycle: Identifiable {
    let id = UUID()
    let name: String
    let make: String
    let model: String
    let year: Int
    let mileage: Int
    var imageName: String
}

struct MotorcyclesView: View {
    @State private var motorcycles: [Motorcycle] = [
        Motorcycle(name: "Night Rider", make: "Honda", model: "CBR600RR", year: 2022, mileage: 3500, imageName: "cbr600rr"),
        Motorcycle(name: "Road King", make: "Kawasaki", model: "Ninja ZX-6R", year: 2021, mileage: 7200, imageName: "ninja")
    ]
    
    @State private var showingAddMotorcycle = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(motorcycles) { motorcycle in
                    NavigationLink(destination: MotorcycleDetailView(motorcycle: motorcycle)) {
                        MotorcycleRow(motorcycle: motorcycle)
                    }
                }
            }
            .navigationTitle("My Motorcycles")
            .toolbar {
                Button(action: { showingAddMotorcycle.toggle() }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddMotorcycle) {
                AddMotorcycleView()
            }
        }
    }
}

struct MotorcycleRow: View {
    let motorcycle: Motorcycle
    
    var body: some View {
        HStack {
            Image(motorcycle.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(motorcycle.name)
                    .font(.headline)
                
                Text("\(motorcycle.year) \(motorcycle.make) \(motorcycle.model)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("\(motorcycle.mileage) miles")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct MotorcyclesView_Previews: PreviewProvider {
    static var previews: some View {
        MotorcyclesView()
    }
}
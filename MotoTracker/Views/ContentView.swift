import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            MotorcyclesView()
                .tabItem {
                    Label("Bikes", systemImage: "bicycle")
                }
            
            MaintenanceView()
                .tabItem {
                    Label("Service", systemImage: "wrench.and.screwdriver.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
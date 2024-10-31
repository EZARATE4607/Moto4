import SwiftUI

struct ProfileView: View {
    @State private var username = "John Rider"
    @State private var email = "john@example.com"
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var units = "Miles"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                }
                
                Section(header: Text("Preferences")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    Toggle("Dark Mode", isOn: $darkModeEnabled)
                    
                    Picker("Distance Units", selection: $units) {
                        Text("Miles").tag("Miles")
                        Text("Kilometers").tag("Kilometers")
                    }
                }
                
                Section(header: Text("App")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                    
                    Button("Privacy Policy") {
                        // Open privacy policy
                    }
                    
                    Button("Terms of Service") {
                        // Open terms of service
                    }
                }
                
                Section {
                    Button("Sign Out") {
                        // Handle sign out
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
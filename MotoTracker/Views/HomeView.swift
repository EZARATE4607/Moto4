import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Hero Section
                    ZStack(alignment: .bottomLeading) {
                        Image("hero_background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .clipped()
                        
                        LinearGradient(
                            gradient: Gradient(colors: [.black.opacity(0.7), .clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                        .frame(height: 150)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Track Your Ride")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("Manage maintenance, track rides, and more")
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .padding()
                    }
                    
                    // Quick Actions
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16) {
                        QuickActionCard(
                            title: "Add Motorcycle",
                            systemImage: "plus.circle.fill",
                            color: .blue
                        )
                        
                        QuickActionCard(
                            title: "Log Service",
                            systemImage: "wrench.fill",
                            color: .green
                        )
                        
                        QuickActionCard(
                            title: "Track Ride",
                            systemImage: "location.fill",
                            color: .orange
                        )
                        
                        QuickActionCard(
                            title: "Statistics",
                            systemImage: "chart.bar.fill",
                            color: .purple
                        )
                    }
                    .padding()
                }
            }
            .navigationTitle("MotoTracker")
        }
    }
}

struct QuickActionCard: View {
    let title: String
    let systemImage: String
    let color: Color
    
    var body: some View {
        Button(action: {}) {
            VStack(spacing: 12) {
                Image(systemName: systemImage)
                    .font(.system(size: 30))
                    .foregroundColor(color)
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 2)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
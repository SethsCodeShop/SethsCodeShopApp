import SwiftUI

struct NavbarView: View {
    @State private var selection = 0
    @EnvironmentObject var auth0Manager: Auth0Manager
    
    var body: some View {
        VStack {
            Spacer()
            
            if !auth0Manager.isAuthenticated && !auth0Manager.isGuest {
                LandingView()
            } else {
                if selection == 0 {
                    SummaryView()
                }
                else if (selection == 1) {
                    AboutView()
                }
                else {
                    ExperienceView()
                }
            }
            
            Spacer()
            
            if auth0Manager.isAuthenticated || auth0Manager.isGuest {
                BottomNavigationView(selection: $selection)
            }
        }
    }
}

struct BottomNavigationView: View {
    @Binding var selection: Int
    @EnvironmentObject var auth0Manager: Auth0Manager
    
    var body: some View {
        HStack {
            Button(action: {
                selection = 0
            }) {
                VStack {
                    Image(systemName: "house.fill")
                        .font(.system(size: 24))
                        .foregroundColor(selection == 0 ? Color.blue : Color.gray)
                    Text("Summary")
                        .font(.caption)
                        .foregroundColor(selection == 0 ? Color.blue : Color.gray)
                }
            }
            
            Spacer()
            
            Button(action: {
                selection = 1
            }) {
                VStack {
                    Image(systemName: "info.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(selection == 1 ? Color.blue : Color.gray)
                    Text("About")
                        .font(.caption)
                        .foregroundColor(selection == 1 ? Color.blue : Color.gray)
                }
            }
            
            Spacer()
            
            Button(action: {
                selection = 2
            }) {
                VStack {
                    Image(systemName: "info.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(selection == 2 ? Color.blue : Color.gray)
                    Text("Experience")
                        .font(.caption)
                        .foregroundColor(selection == 2 ? Color.blue : Color.gray)
                }
            }
            
            Spacer()
            
            if auth0Manager.isAuthenticated {
                Button(action: {
                    auth0Manager.logout()
                }) {
                    VStack {
                        Image(systemName: "person.crop.circle.badge.xmark")
                            .font(.system(size: 24))
                            .foregroundColor(Color.red)
                        Text("Logout")
                            .font(.caption)
                            .foregroundColor(Color.red)
                    }
                }
            } else {
                Button(action: {
                    auth0Manager.login()
                }) {
                    VStack {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 24))
                            .foregroundColor(Color.blue)
                        Text("Login")
                            .font(.caption)
                            .foregroundColor(Color.blue)
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
    }
}


struct NavbarView_Previews: PreviewProvider {
    static var previews: some View {
        NavbarView()
            .environmentObject(Auth0Manager.shared)
    }
}

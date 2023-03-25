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
                    ResumeView()
                } else {
                    AboutView()
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
            Spacer()
            
            Button(action: {
                selection = 0
            }) {
                VStack {
                    Image(systemName: "house.fill")
                        .font(.system(size: 24))
                    Text("Home")
                        .font(.caption)
                }
                .foregroundColor(selection == 0 ? Color.blue : Color.gray)
            }
            
            Spacer()
            
            Button(action: {
                selection = 1
            }) {
                VStack {
                    Image(systemName: "info.circle.fill")
                        .font(.system(size: 24))
                    Text("About")
                        .font(.caption)
                }
                .foregroundColor(selection == 1 ? Color.blue : Color.gray)
            }
            
            Spacer()
            
            if auth0Manager.isAuthenticated {
                Button(action: {
                    auth0Manager.logout()
                }) {
                    Image(systemName: "info.circle.fill")
                        .font(.system(size: 24))
                    Text("Logout")
                        .font(.caption)
                }
            } else {
                Button(action: {
                    auth0Manager.login()
                }) {
                    Image(systemName: "info.circle.fill")
                        .font(.system(size: 24))
                    Text("Login")
                        .font(.caption)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}

struct NavbarView_Previews: PreviewProvider {
    static var previews: some View {
        NavbarView()
            .environmentObject(Auth0Manager.shared)
    }
}

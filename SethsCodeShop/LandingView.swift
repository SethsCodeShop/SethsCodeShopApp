//
//  LandingView.swift
//  SethsCodeShop
//
//  Created by Seth Garlett on 3/25/23.
//

import SwiftUI

struct LandingView: View {
    @EnvironmentObject var auth0Manager: Auth0Manager
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to the App")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button(action: {
                auth0Manager.login()
            }) {
                Text("Log in")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Button(action: {
                auth0Manager.continueAsGuest()
            }) {
                Text("Continue as a guest")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
            .environmentObject(Auth0Manager.shared)
    }
}

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
            Text("Welcome to")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Text("Seth's Code Shop!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 50)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Image(uiImage:  #imageLiteral(resourceName:"CodeShop.png"))
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
            Spacer()
            
            Button(action: {
                auth0Manager.login()
            }) {
                Text("Log in / Sign up")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
            
            Button(action: {
                auth0Manager.continueAsGuest()
            }) {
                Text("Continue as a guest")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
            .environmentObject(Auth0Manager.shared)
    }
}

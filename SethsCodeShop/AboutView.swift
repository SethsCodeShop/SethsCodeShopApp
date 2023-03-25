//
//  AboutView.swift
//  SethsCodeShop
//
//  Created by Seth Garlett on 3/25/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("About This App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("This app showcases my technical expertise in software development and is built using Swift 5.7.2. The purpose of the app is to display my programming skills, experience, and knowledge.")
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("API and Authentication:")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("The app communicates with a Next.js API to fetch data and perform various operations. It uses Auth0 for authentication, ensuring a secure and modern authentication experience for users.")
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

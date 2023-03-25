//
//  SethsCodeShopApp.swift
//  SethsCodeShop
//
//  Created by Seth Garlett on 3/25/23.
//

import SwiftUI

@main
struct SethsCodeShopApp: App {
    @StateObject private var auth0Manager = Auth0Manager()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavbarView()
                .environmentObject(auth0Manager)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

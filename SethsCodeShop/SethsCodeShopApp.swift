//
//  SethsCodeShopApp.swift
//  SethsCodeShop
//
//  Created by Seth Garlett on 3/25/23.
//

import SwiftUI

@main
struct SethsCodeShopApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

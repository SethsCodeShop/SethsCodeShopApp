//
//  Auth0Manager.swift
//  SethsCodeShop
//
//  Created by Seth Garlett on 3/25/23.
//

import Foundation
import SwiftUI
import Auth0

class Auth0Manager: ObservableObject {
    static let shared = Auth0Manager()
    
    @Published var isAuthenticated: Bool = false
    @Published var isGuest: Bool = false
    
    func login() {
        Auth0
            .webAuth()
            .start { result in
                switch result {
                case .success(let credentials):
                    print("Obtained credentials: \(credentials)")
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
    
    func logout() {
        Auth0
            .webAuth()
            .clearSession { result in
                switch result {
                case .success:
                    print("Logged out")
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
    
    func continueAsGuest() {
         DispatchQueue.main.async {
             self.isGuest = true
         }
     }
}

//
//  ExperienceViewModel.swift
//  SethsCodeShop
//
//  Created by Seth Garlett on 3/25/23.
//

import SwiftUI
import Combine

struct Experience: Codable, Identifiable {
    let id = UUID()
    let Company: String
    let Title: String
    let StartDate: String
    let EndDate: String
    let Responsibilities: [String]
}

class ExperienceViewModel: ObservableObject {
    @Published var experienceData: [Experience] = []
    @Published var isLoading = false
    
    func fetchExperienceData() {
        isLoading = true
        API.shared.fetchExperienceData { result in
            switch result {
            case .success(let experienceData):
                DispatchQueue.main.async {
                    self.experienceData = experienceData
                    self.isLoading = false
                }
            case .failure(let error):
                print("Error fetching experience data: \(error.localizedDescription)")
                self.isLoading = false
            }
        }
    }
}

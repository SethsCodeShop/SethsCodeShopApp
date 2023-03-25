//
//  ExperienceView].swift
//  SethsCodeShop
//
//  Created by Seth Garlett on 3/25/23.
//

import SwiftUI

struct ExperienceView: View {
    @StateObject var viewModel = ExperienceViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(viewModel.experienceData) { experience in
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(experience.Company) - \(experience.Title)")
                            .font(.title2)
                            .bold()
                        
                        Text("\(experience.StartDate) - \(experience.EndDate)")
                            .font(.subheadline)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(experience.Responsibilities, id: \.self) { responsibility in
                                Text("• \(responsibility)")
                                    .font(.body)
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchExperienceData()
        }
    }
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView()
    }
}

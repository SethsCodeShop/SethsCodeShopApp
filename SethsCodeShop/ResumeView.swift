//
//  ResumeView.swift
//  SethsCodeShop
//
//  Created by Seth Garlett on 3/25/23.
//

import SwiftUI

struct ResumeView: View {
    fileprivate func GetSummary() -> some View {
        return VStack(alignment: .leading, spacing: 10) {
            SectionTitle(title: "SUMMARY")
            Text("Experienced IT professional with a proven track record in programming, project management, team leadership, and business unit relationship management. Successfully provided technical expertise during the sales life-cycle and collaborated with various department executives and product stakeholders to develop and deliver high-quality applications that demonstrate product efficiency and business impact. Adept at advising clients on design and architecture for their specific business needs.")
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top)
    }
    
    fileprivate func GetTechProficiency() -> some View {
        return VStack(alignment: .leading, spacing: 10) {
            SectionTitle(title: "TECHNICAL PROFICIENCY")
            Group {
                Text("Languages:")
                    .font(.body)
                    .fontWeight(.bold)
                Text("Proficient in: C#, JavaScript(AJAX, JSON, JQUERY), T-SQL, React")
                    .font(.body)
                
                Text("Technologies/Frameworks:")
                    .font(.body)
                    .fontWeight(.bold)
                Text("Salesforce, Vivun, .NET Framework 3.5/4.0+, Web API, .Net Core 3.2, .Net Core 6.0, Azure DevOps, GIT, Postman, Swift 5.7.2")
                    .font(.body)
            }
            .padding(.top)
            
            SectionTitle(title: "Certifications")
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Image("Headshot")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                Text("SETH GARLETT")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Link("Email", destination: URL(string: "skgarlett@gmail.com")!)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Link("LinkedIn", destination: URL(string: "https://www.linkedin.com/in/sethgarlett")!)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Link("Github", destination: URL(string: "https://github.com/SethsCodeShop?tab=repositories")!)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Link("SethsCodeShop.com", destination: URL(string: "https://www.sethscodeshop.com")!)
                            .font(.subheadline)
                    }
                }
                .padding(.top)
                
                GetSummary()
                
                GetTechProficiency()
            }
            .padding()
        }
    }
}

struct SectionTitle: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.top)
    }
}

struct ResumeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeView()
    }
}

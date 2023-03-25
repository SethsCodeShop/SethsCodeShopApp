//
//  CallAPI.swift
//  SethsCodeShop
//
//  Created by Seth Garlett on 3/25/23.
//

import Foundation

class API {
    static let shared = API()
    
    func fetchExperienceData(completion: @escaping (Result<[Experience], Error>) -> Void) {
        let urlString = Bundle.main.infoDictionary?["ServerURL"] as! String + "profileInfo"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let experienceData = try decoder.decode([Experience].self, from: data)
                completion(.success(experienceData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

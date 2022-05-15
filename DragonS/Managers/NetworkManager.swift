//
//  NetworkManager.swift
//  DragonS
//
//  Created by Aleksandra on 06.05.2022.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getDragons(completion: @escaping (Result<[DragonsList], ErrorMessage>) -> Void) {
        let urlString = "https://api.spacexdata.com/v4/dragons"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let _ = error {
                completion(.failure(.unableToComplite))
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let dragons = try JSONDecoder().decode([DragonsList].self, from: data)
                completion(.success(dragons))
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
    
    func getDragonInfo(at id: String, completion: @escaping (Result<DragonInfo, ErrorMessage>) -> Void) {
        let urlString = "https://api.spacexdata.com/v4/dragons/\(id)"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let _ = error {
                completion(.failure(.unableToComplite))
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let dragon = try JSONDecoder().decode(DragonInfo.self, from: data)
                completion(.success(dragon))
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
}





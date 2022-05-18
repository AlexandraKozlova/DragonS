//
//  NetworkManager.swift
//  DragonS
//
//  Created by Aleksandra on 06.05.2022.
//

import UIKit
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()
    private var subscriptions = Set<AnyCancellable>()
    
    func getDragons() -> Future<[DragonsList], ErrorMessage> {
        return Future<[DragonsList], ErrorMessage> {
            [weak self] promise in
            let urlString = "https://api.spacexdata.com/v4/dragons"
            guard let self = self else { return }
            guard let url = URL(string: urlString) else {
                promise(.failure(.invalidUrl))
                return
            }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let hhtpResponse = response as? HTTPURLResponse,
                          200 == hhtpResponse.statusCode
                    else {
                        throw ErrorMessage.invalidUrl
                    }
                    return data
                }
                .decode(type: [DragonsList].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case _ as URLError:
                            promise(.failure(.invalidUrl))
                        case _ as DecodingError:
                            promise(.failure(.invalidData))
                        default:
                            promise(.failure(.unableToComplite))
                        }
                    }
                } receiveValue: { promise(.success(($0))) }
                .store(in: &self.subscriptions)
        }
    }
    
    func getDragonInfo(at id: String) -> Future<DragonInfo, ErrorMessage> {
        
        return Future<DragonInfo, ErrorMessage> {
            [weak self] promise in
            let urlString = "https://api.spacexdata.com/v4/dragons/\(id)"
            guard let self = self else { return }
            guard let url = URL(string: urlString) else {
                promise(.failure(.invalidUrl))
                return
            }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let hhtpResponse = response as? HTTPURLResponse,
                          200 == hhtpResponse.statusCode
                    else {
                        throw ErrorMessage.unableToComplite
                    }
                    return data
                }
                .decode(type: DragonInfo.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case _ as URLError:
                            promise(.failure(.invalidUrl))
                        case _ as DecodingError:
                            promise(.failure(.invalidData))
                        default:
                            promise(.failure(.unableToComplite))
                        }
                    }
                } receiveValue: { promise(.success(($0))) }
                .store(in: &self.subscriptions)
        }
    }
}





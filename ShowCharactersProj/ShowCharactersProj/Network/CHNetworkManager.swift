//
//  CHNetworkManager.swift
//  ShowCharactersProj
//
//  Created by Vaibhav Pandey on 17/09/24.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

struct Mapper {
    static let decoder = JSONDecoder()
}

class CHNetworkManager {

    // MARK: - Properties

    private var session: URLSession!
    
    // MARK: - Initializer

    init() {
        session = URLSession(configuration: .ephemeral)
    }
    
    deinit {
        cancelAllTask()
    }
    
    // MARK: - Public Methods

    public func dataTaskFromURL<T: Decodable>(_ url: URL, completion: @escaping ((Result<T>) -> Void)) -> URLSessionDataTask {
                
        return session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error == nil,
                let data = data {
                do {
                    let response = try Mapper.decoder.decode(T.self, from: data)
                    completion(.success(response))
                } catch let parsingError {
                    completion(.failure(parsingError))
                }
            } else {
                completion(.failure(error!))
            }
        })
    }
    
    public func cancelAllTask() {
        session.invalidateAndCancel()
    }
}

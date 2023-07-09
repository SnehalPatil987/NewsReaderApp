//
//  APIHandler.swift
//  News_Reader_App
//
//  Created by Snehal Shrikant Patil on 05/07/23.
//

import Foundation

class APIHandler {
    
    
   
}

extension  URLSession {
   
    enum CustomError: Error {
        case invalidUrl
        case invalidData
    }
    
    func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void)
        {
            guard let url = url else {
                completion(.failure(CustomError.invalidUrl))
                return
            }
            
            let task = dataTask(with: url) { data, _, error in
                guard let data = data else {
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.failure(CustomError.invalidData))
                    }
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(expecting, from: data)
                    print("AAA")
                    print(result)
                    completion(.success(result))
                    
                } catch {
                    print("XXXXXXX")
                    completion(.failure(error))
                }
                
            }
            task.resume()
            
        }
    
}

//
//  APIService.swift
//  Anywhere Reader
//
//  Created by Conner on 12/10/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

enum Result {
    case success
    case failure
}

class APIService {
    static let shared = APIService()
    static let baseURL = URL(string: "https://anywhere-reader-test.herokuapp.com")!
    
    func verifyAccessToken(with accessToken: String, completion: @escaping (Result, Error?) -> Void) {
        let url = APIService.baseURL.appendingPathComponent("auth").appendingPathComponent("convert_token/")
        var request = URLRequest(url: url)
        let body: [String: Any] = ["token": accessToken]
        
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                NSLog("Error with GETting verified token: \(error)")
                completion(.failure, error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let tokenInformation = try JSONDecoder().decode(TokenInformation.self, from: data)
                print(tokenInformation)
            } catch {
                NSLog("Error with decoding Token Information")
            }
            
            completion(.success, nil)
        }.resume()
    }
}

struct TokenInformation: Codable {
    let accessToken: String
    let expiresIn: Int
    let tokenType: String
    let scope: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case tokenType = "token_type"
        case scope = "scope"
        case refreshToken = "refresh_token"
    }
}

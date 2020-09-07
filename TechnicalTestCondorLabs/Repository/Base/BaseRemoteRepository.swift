//
//  BaseRepository.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 5/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation
import Alamofire

class BaseRemoteRepository {
    
    func sendRequest<T: Decodable>(_ endpoint: String, of: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let requestURL = NetworkConstants.baseURL + endpoint
        let headers: HTTPHeaders = [
            .init(name: "x-api-key", value: NetworkConstants.apiKey)
        ]
        
        let request = AF.request(requestURL, method: .get, headers: headers)
        request
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self, queue: .global(qos: .background)) { response in
                if let error = response.error {
                    print(error)
                    completion(.failure(.parsingData))
                    return
                }
                let validationResult = response.result
                switch validationResult {
                case .success(let object):
                    completion(.success(object))
                    break
                case .failure(let error):
                    print(error)
                    completion(.failure(.responseUnsuccessfull))
                    break
                }
        }
    }
    
    
}

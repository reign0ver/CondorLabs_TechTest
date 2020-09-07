//
//  BreedsRemoteDataSource.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 5/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation
import Alamofire


class BreedsRemoteRepository: BaseRemoteRepository, BreedsRemoteRepositoryProtocol {
    
    func getListOfBreeds(completion: @escaping (Result<[Breed], NetworkError>) -> Void) {
        let endpoint = NetworkConstants.fetchListOfBreeds
        sendRequest(endpoint, of: [Breed].self) { result in
            switch result {
            case .success(let breeds):
                completion(.success(breeds))
                break
            case.failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
    
}

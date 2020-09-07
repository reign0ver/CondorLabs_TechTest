//
//  BreedsDataRepository.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 5/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

class BreedsDataRepository {
    
    var remoteRepository: BreedsRemoteRepositoryProtocol
    
    init(_ remoteRepository: BreedsRemoteRepositoryProtocol) {
        self.remoteRepository = remoteRepository
    }
    
    func fetchBreeds(completion: @escaping (Result<[Breed], NetworkError>) -> Void) {
        remoteRepository.getListOfBreeds(completion: completion)
    }
    
}

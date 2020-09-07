//
//  CatImagesDataRepository.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

class CatImagesDataRepository {
    
    var localRepository: CatImagesLocalRepositoryProtocol
    var remoteRepository: CatImagesRemoteRepositoryProtocol
    
    init(_ localRepository: CatImagesLocalRepositoryProtocol, _ remoteRepository: CatImagesRemoteRepositoryProtocol) {
        self.localRepository = localRepository
        self.remoteRepository = remoteRepository
    }
    
    func fetchBreedImage(_ breedId: String, completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        remoteRepository.getBreedImage(breedId, completion: completion)
    }
    
    func getRandomImages(completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        remoteRepository.getRandomImages(completion: completion)
    }
    
}

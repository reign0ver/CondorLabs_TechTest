//
//  CatImagesRemoteRepository.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

class CatImagesRemoteRepository: BaseRemoteRepository, CatImagesRemoteRepositoryProtocol {
    
    func getBreedImage(_ breedId: String, completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        let endpoint = NetworkConstants.fetchImageByBreed + breedId
        sendRequest(endpoint, of: [ImageBreed].self) { result in
            switch result {
            case .success(let imageURL):
                completion(.success(imageURL))
                break
            case.failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
    
    func getRandomImages(completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        let endpoint = NetworkConstants.fetchRandomImages
        sendRequest(endpoint, of: [ImageBreed].self) { result in
            switch result {
            case .success(let imageURL):
                completion(.success(imageURL))
                break
            case.failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
    
}

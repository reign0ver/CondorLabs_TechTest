//
//  BreedsMockRepository.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 7/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

class CatImagesMockRepository: CatImagesRemoteRepositoryProtocol {
    
    let imageBreed: [ImageBreed] = [
        ImageBreed(id: "xx123xx", url: "https://www.google.com")
    ]
    
    func getBreedImage(_ breedId: String, completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        if breedId == "validBreedId" {
            completion(.success(imageBreed))
        } else {
            completion(.failure(.genericError))
        }
    }
    
    func getRandomImages(completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        completion(.success(imageBreed))
    }
}

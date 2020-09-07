//
//  BreedsMockRepository.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 7/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

class CatImagesMockRepository: CatImagesRemoteRepositoryProtocol {
    
    func getBreedImage(_ breedId: String, completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        //TODO
    }
    
    func getRandomImages(completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        //TODO
    }
}

//
//  CatImagesRemoteRepositoryProtocol.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

protocol CatImagesRemoteRepositoryProtocol {
    
    func getBreedImage(_ breedId: String, completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void)
    
    func getRandomImages(completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void)
}

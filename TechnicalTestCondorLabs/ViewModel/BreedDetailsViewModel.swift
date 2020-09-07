//
//  BreedDetailsViewModel.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

protocol ImageViewModelDelegate: class {
    func updateImageURL()
}

class BreedDetailsViewModel {
    
    var repository: CatImagesDataRepository
    
    var imageURL: String = ""
    weak var delegate: ImageViewModelDelegate?
    
    
    //MARK: Init
    init(_ repository: CatImagesDataRepository) {
        self.repository = repository
    }
    
    func getBreedImageURL(_ breedId: String) {
        repository.fetchBreedImage(breedId) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let imageBreed):
                strongSelf.imageURL = imageBreed[0].url
                strongSelf.delegate?.updateImageURL()
            case .failure(let error):
                print("Error at imageViewModel -> ", error)
            }
        }
    }
    
}

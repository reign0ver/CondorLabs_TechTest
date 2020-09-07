//
//  LikesViewModel.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

protocol LikesViewModelDelegate: class {
    func updateView()
}

class LikesViewModel {
    
    private var repository: CatImagesDataRepository
    
    var image: ImageBreed?
    weak var delegate: LikesViewModelDelegate?
    
    let navigationTitle = "Votes"
    
    
    //MARK: Init
    init(_ repository: CatImagesDataRepository) {
        self.repository = repository
    }
    
    func getRandomImages() {
        repository.fetchRandomImages { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let images):
                strongSelf.image = images[0]
                strongSelf.delegate?.updateView()
                break
            case .failure(let error):
                print("Error at LikesViewModel -> ", error)
            }
        }
    }
    
    func saveVote(_ vote: KindOfVote) {
        guard let image = image else { return }
        repository.saveVote(vote, imageBreed: image)
    }
}

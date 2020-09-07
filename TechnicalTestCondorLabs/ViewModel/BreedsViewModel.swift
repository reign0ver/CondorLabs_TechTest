//
//  BreedsViewModel.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 5/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

protocol BreedsViewModelDelegate: class {
    func reloadData()
}

class BreedsViewModel {
    
    private var repository: BreedsDataRepository
    
    var breeds: [Breed] = []
    weak var delegate: BreedsViewModelDelegate?
    
    //MARK: View Messages
    let navigationTitle = "Cat Breeds"
    
    
    //MARK: Init
    init(repository: BreedsDataRepository) {
        self.repository = repository
    }
    
    func getListOfBreeds() {
        repository.fetchBreeds { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let breeds):
                strongSelf.breeds = breeds
                strongSelf.delegate?.reloadData()
                break
            case .failure(let error):
                print("Error at BreedsViewModel", error)
                break
            }
        }
    }
    
}

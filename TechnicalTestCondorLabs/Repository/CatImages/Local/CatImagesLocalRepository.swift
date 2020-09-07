//
//  BreedsLocalDataSource.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 5/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

class CatImagesLocalRepository: CatImagesLocalRepositoryProtocol {
    
    let persistInstance = BaseLocalRepository<VoteEntity>()
    
    func save(vote: VoteEntity) {
        do {
            try persistInstance.insert(vote)
        } catch {
            print(error)
        }
        
    }
    
}

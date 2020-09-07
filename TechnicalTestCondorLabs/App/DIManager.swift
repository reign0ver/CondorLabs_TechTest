//
//  DIManager.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation
import Swinject

class DIManager {
    
    let container: Container
    
    init() {
        self.container = Container()
        registerDependencies()
    }
    
    private func registerDependencies() {
        #if MOCKS
        container.register(BreedsRemoteRepositoryProtocol.self) { _ in
            BreedsMockRepository()
        }
        
        container.register(CatImagesRemoteRepositoryProtocol.self) { _ in
            CatImagesMockRepository()
        }
        container.register(CatImagesLocalRepositoryProtocol.self) { _ in
            CatImagesLocalRepository()
        }
        #else
        container.register(BreedsRemoteRepositoryProtocol.self) { _ in
            BreedsRemoteRepository()
        }
        
        container.register(CatImagesRemoteRepositoryProtocol.self) { _ in
            CatImagesRemoteRepository()
        }
        container.register(CatImagesLocalRepositoryProtocol.self) { _ in
            CatImagesLocalRepository()
        }
        #endif
        
        //Repositories
        container.register(BreedsDataRepository.self) { r in
            BreedsDataRepository(r.resolve(BreedsRemoteRepositoryProtocol.self)!)
        }
        container.register(CatImagesDataRepository.self) { r in
            CatImagesDataRepository(r.resolve(CatImagesLocalRepositoryProtocol.self)!, r.resolve(CatImagesRemoteRepositoryProtocol.self)!)
        }
        
        //ViewModels
        container.register(BreedsViewModel.self) { r in
            BreedsViewModel(repository: r.resolve(BreedsDataRepository.self)!)
        }
        container.register(BreedDetailsViewModel.self) { r in
            BreedDetailsViewModel(r.resolve(CatImagesDataRepository.self)!)
        }
        container.register(LikesViewModel.self) { r in
            LikesViewModel(r.resolve(CatImagesDataRepository.self)!)
        }
        
        //Views
        container.register(ListOfBreedsViewController.self) { r in
            ListOfBreedsViewController(viewModel: r.resolve(BreedsViewModel.self)!)
        }
    }
}

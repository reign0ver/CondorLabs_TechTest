//
//  TechnicalTestCondorLabsTests.swift
//  TechnicalTestCondorLabsTests
//
//  Created by Andrés Carrillo on 5/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import XCTest
@testable import TechnicalTestCondorLabs

class TechnicalTestCondorLabsTests: XCTestCase {
    
    var catImagesDataRepository: CatImagesDataRepository!
    var breedsDataRepository: BreedsDataRepository!
    
    let dependencyInjector = DIManager()
    
    override func setUp() {
        catImagesDataRepository = CatImagesDataRepository(dependencyInjector.container.resolve(CatImagesLocalRepositoryProtocol.self)!,
                                                          dependencyInjector.container.resolve(CatImagesRemoteRepositoryProtocol.self)!)
        breedsDataRepository = BreedsDataRepository(dependencyInjector.container.resolve(BreedsRemoteRepositoryProtocol.self)!)
    }
    
    func testCatRandomImageSuccessResponse() {
        //Arrange - Act
        catImagesDataRepository.fetchRandomImages(completion: { result in
            switch result {
            case .success(let images):
                //Assert
                XCTAssertNotNil(images)
            case .failure(_):
                break
            }
        })
    }
    
    func testCatImageBreedSuccessResponse() {
        //Arrange
        let breedId = "validBreedId"
        //Act
        catImagesDataRepository.fetchBreedImage(breedId, completion: { result in
            switch result {
            case .success(let images):
                //Assert
                XCTAssertNotNil(images)
            case .failure(_):
                break
            }
        })
    }
    
    func testCatImageBreedUnsuccessResponse() {
        //Arrange
        let breedId = "Angora"
        let expectedMessageError = "Ups.  Something went wrong:(.  Try later."
        //Act
        catImagesDataRepository.fetchBreedImage(breedId, completion: { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                //Assert
                XCTAssertEqual(error.rawValue, expectedMessageError)
            }
        })
    }
    
    func testGetListOfBreedsSuccessResponse() {
        //Arrange
        breedsDataRepository.fetchBreeds { result in
            switch result {
            case .success(let breeds):
                XCTAssertNotNil(breeds)
            case .failure(_):
                break
            }
        }
    }

}

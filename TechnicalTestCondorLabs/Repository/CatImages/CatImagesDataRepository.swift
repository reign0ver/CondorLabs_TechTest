//
//  CatImagesDataRepository.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

class CatImagesDataRepository {
    
    var localRepository: CatImagesLocalRepositoryProtocol
    var remoteRepository: CatImagesRemoteRepositoryProtocol
    
    init(_ localRepository: CatImagesLocalRepositoryProtocol, _ remoteRepository: CatImagesRemoteRepositoryProtocol) {
        self.localRepository = localRepository
        self.remoteRepository = remoteRepository
    }
    
    func fetchBreedImage(_ breedId: String, completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        remoteRepository.getBreedImage(breedId, completion: completion)
    }
    
    func fetchRandomImages(completion: @escaping (Result<[ImageBreed], NetworkError>) -> Void) {
        remoteRepository.getRandomImages(completion: completion)
    }
    
    func saveVote(_ vote: KindOfVote, imageBreed: ImageBreed) {
        let vote = mapIntoVoteEntity(vote.rawValue, imageBreed)
        localRepository.save(vote: vote)
    }
    
    private func mapIntoVoteEntity(_ kindOfVote: String, _ imageBreed: ImageBreed) -> VoteEntity {
        let vote = VoteEntity()
        vote.name = imageBreed.id
        vote.imageURL = imageBreed.url
        vote.vote = kindOfVote
        return vote
    }
    
}

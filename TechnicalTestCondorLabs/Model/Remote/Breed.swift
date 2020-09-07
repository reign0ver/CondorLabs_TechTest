//
//  Breed.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 5/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

struct Breed: Decodable {
    var alternativeNames: String?
    var experimental: Int
    var hairless: Int
    var hypoallergenic: Int
    var id: String
    var lifeSpan: String
    var name: String
    var description: String
    var natural: Int
    var origin: String
    var rare: Int
    var rex: Int
    var shortLegs: Int
    var suppressedTail: Int
    var temperament: String
    var wikipediaURL: String?
    
    private enum CodingKeys: CodingKey {
        case alt_names
        case experimental
        case hairless
        case hypoallergenic
        case id
        case life_span
        case name
        case description
        case natural
        case origin
        case rare
        case rex
        case short_legs
        case suppressed_tail
        case temperament
        case wikipedia_url
    }
    
    init(from decoder: Decoder) throws {
        let container           = try decoder.container(keyedBy: CodingKeys.self)
        self.alternativeNames   = try container.decodeIfPresent(String.self, forKey: .alt_names)
        self.experimental       = try container.decode(Int.self, forKey: .experimental)
        self.hairless           = try container.decode(Int.self, forKey: .hairless)
        self.hypoallergenic     = try container.decode(Int.self, forKey: .hypoallergenic)
        self.id                 = try container.decode(String.self, forKey: .id)
        self.lifeSpan           = try container.decode(String.self, forKey: .life_span)
        self.name               = try container.decode(String.self, forKey: .name)
        self.description        = try container.decode(String.self, forKey: .description)
        self.natural            = try container.decode(Int.self, forKey: .natural)
        self.origin             = try container.decode(String.self, forKey: .origin)
        self.rare               = try container.decode(Int.self, forKey: .rare)
        self.rex                = try container.decode(Int.self, forKey: .rex)
        self.shortLegs          = try container.decode(Int.self, forKey: .short_legs)
        self.suppressedTail     = try container.decode(Int.self, forKey: .suppressed_tail)
        self.temperament        = try container.decode(String.self, forKey: .temperament)
        self.wikipediaURL       = try container.decodeIfPresent(String.self, forKey: .wikipedia_url)
    }
}

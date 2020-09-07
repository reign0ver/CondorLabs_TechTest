//
//  NetworkConstants.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

struct NetworkConstants {
    static let apiKey = "1d704cf5-0297-4b2d-90d1-cfbbb51117dc"
    static let baseURL = "https://api.thecatapi.com/v1"
    static let fetchListOfBreeds = "/breeds"
    static let fetchImageByBreed = "/images/search?breed_ids="
    static let fetchRandomImages = "/images/search"
}

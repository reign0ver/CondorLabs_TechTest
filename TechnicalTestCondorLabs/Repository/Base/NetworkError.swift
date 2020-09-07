//
//  NetworkError.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 5/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

enum NetworkError: String, Error {
    case parsingData = "Failed to fetch the data :("
    case responseUnsuccessfull = "Something went wrong with the server.  Try later."
    case genericError = "Ups.  Something went wrong:(.  Try later."
}

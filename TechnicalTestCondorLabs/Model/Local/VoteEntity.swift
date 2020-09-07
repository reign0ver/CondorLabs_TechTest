//
//  VoteEntity.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 7/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation
import RealmSwift

class VoteEntity: Object {
    @objc
    dynamic var name: String = ""
    
    @objc
    dynamic var date: Date = Date()
    
    @objc
    dynamic var imageURL: String = ""
    
    @objc
    dynamic var vote: String = ""
}

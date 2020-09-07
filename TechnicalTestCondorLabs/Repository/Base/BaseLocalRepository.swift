//
//  RealmManager.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 5/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation
import RealmSwift

class BaseLocalRepository<T: RealmSwift.Object> {
    
    private var realm: Realm!
    
    init() {
        initializeRealm()
    }
    
    private func initializeRealm() {
        do {
            realm = try Realm()
        } catch {
            print("Error while initializing Realm -> \(error.localizedDescription)")
        }
    }
    
    func insert(_ object: T) throws {
        do {
            try realm.write { realm.add(object) }
        } catch {
            throw NetworkError.genericError
        }
    }
    
    func findAll() -> Results<T> {
        return realm.objects(T.self)
    }
}

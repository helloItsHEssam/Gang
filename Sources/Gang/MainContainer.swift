//
//  MainContainer.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/23/23.
//

import Foundation

final class MainContainer {
    
    static private(set) var shared = MainContainer()
    
    private var dependencies: [String : Any]
    
    public init() {
        self.dependencies = [:]
    }

    final func allKeys() -> [String] {
        return dependencies.map {
            $0.key
        }
    }
    
    final func register(dependency object: Any, key: String) {
        self.dependencies[key] = object
    }

    final func remove(key: String) {
        self.dependencies.removeValue(forKey: key)
    }
    
    final func resolve<T>(key: String) throws -> T {
        guard let dependency = dependencies[key] as? T else {
            throw GangError.cannotFindYourDependency
        }
        
        return dependency
    }
}

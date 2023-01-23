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
    
    final func register(dependency object: Any, key: String) {
        self.dependencies[key] = object
    }

    final func remove(dependency object: Any, key: String) {
        self.dependencies.removeValue(forKey: key)
    }
    
    final func resolve<T>() -> T {
        let key = String(describing: T.self)
        guard let dependency = dependencies[key] as? T else {
            fatalError("unfortunately, we did not find your need object with \(key) :(")
        }
        
        return dependency
    }
}

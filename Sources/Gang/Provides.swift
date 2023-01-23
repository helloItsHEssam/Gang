//
//  File.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/23/23.
//

import Foundation

@propertyWrapper
struct Provides<T: Any> {
    var wrappedValue: T

    init(data: () -> Provide) {
        let objc = data()
        guard objc is T else {
            fatalError("mismacheable type")
        }
        
        self.wrappedValue = objc as! T
                
        MainContainer.shared.register(dependency: self.wrappedValue, key: String(describing: T.self))
    }
}

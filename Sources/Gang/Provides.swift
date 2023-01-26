//
//  Provides.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/23/23.
//

import Foundation

@propertyWrapper
public struct Provides<T: Any> {
    public var wrappedValue: T!

    public init(data: () -> Provide) {
        let objc = data()
        guard let castObjc = objc as? T else {
            return
        }
        
        self.wrappedValue = castObjc
                
        MainContainer.shared.register(dependency: self.wrappedValue!, key: String(describing: T.self))
    }
}

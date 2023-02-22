//
//  Inject.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/23/23.
//

import Foundation

@propertyWrapper
public struct Inject<T> {
    public var wrappedValue: T!

    public init() {
        self.wrappedValue = try? MainContainer.shared.resolve(key: String(describing: T.self))
    }
}

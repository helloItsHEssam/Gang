//
//  AppContainer.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/23/23.
//

import Foundation

@propertyWrapper
public struct AppContainer<T: Initializable & Container> {
    public var wrappedValue: T

    public init(impl: T.Type) {
        self.wrappedValue = impl.init()
    }
}

//
//  Inject.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/23/23.
//

import Foundation

@propertyWrapper
public struct Inject<T> {
    public var wrappedValue: T

    init() {
        self.wrappedValue = MainContainer.shared.resolve()
    }
}

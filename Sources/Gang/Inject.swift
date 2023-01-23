//
//  File.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/23/23.
//

import Foundation

@propertyWrapper
struct Inject<T> {
    var wrappedValue: T

    init() {
        self.wrappedValue = MainContainer.shared.resolve()
    }
}

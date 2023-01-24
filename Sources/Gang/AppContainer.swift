//
//  AppContainer.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/23/23.
//

import Foundation

@propertyWrapper
public struct AppContainer<T: Any> {
    public var wrappedValue: T

    public init(type: Initializable.Type) {
        let objc = type.init()
        guard objc is T else {
            
            fatalError("oops!, your data does not implement Initializable protocol.")
        }
        
        self.wrappedValue = objc as! T
    }
}

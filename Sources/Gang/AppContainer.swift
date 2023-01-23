//
//  AppContainer.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/23/23.
//

import Foundation

@propertyWrapper
struct AppContainer<T: Any> {
    var wrappedValue: T

    init(type: Initializable.Type) throws {
        let objc = type.init()
        guard objc is T else {
            
            fatalError("oops!, your data does not implement Initializable protocol.")
        }
        
        self.wrappedValue = objc as! T
    }
}

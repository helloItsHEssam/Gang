//
//  File.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/23/23.
//

import Foundation

@propertyWrapper
struct Binds<T: Any> {
    var wrappedValue: T

    init(type: Initializable.Type) {
        let objc = type.init()
        guard objc is T else {
            fatalError("fatall error!")
        }
        
        self.wrappedValue = objc as! T
        
        MainContainer.shared.register(dependency: self.wrappedValue, key: String(describing: T.self))
    }
}

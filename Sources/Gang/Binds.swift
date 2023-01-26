//
//  Binds.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/23/23.
//

import Foundation

@propertyWrapper
public struct Binds<T: Any> {
    public var wrappedValue: T!

    public init(impl: Initializable.Type) {
        let objc = impl.init()
        guard let castObjc = objc as? T else {
            return
        }

        self.wrappedValue = castObjc        
        MainContainer.shared.register(dependency: self.wrappedValue!, key: String(describing: T.self))
    }
}

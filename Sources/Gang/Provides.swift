//
//  Provides.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/23/23.
//

import Foundation

@propertyWrapper
public struct Provides<T: Any> {
    
    @available(*, unavailable,
                message: "@Binds is only available on Container protocol")
    public var wrappedValue: T {
        get { fatalError() }
        set { fatalError() }
    }
    
    private var _value: T!
    
    public init(data: () -> Provide) {
        let objc = data()
        guard let castObjc = objc as? T else {
            return
        }
        
        self._value = castObjc
        
        MainContainer.shared.register(dependency: self._value!, key: String(describing: T.self))
    }
    
    public static subscript<A: Container>(
        _enclosingInstance object: A,
        wrapped _: ReferenceWritableKeyPath<A, T>,
        storage storage: ReferenceWritableKeyPath<A, Self>) -> T {
            get {
                let value = object[keyPath: storage]._value
                if (value != nil) {
                    return value!
                } else {
                    fatalError("We can not find your object to use. you probably made a mistake in your Binds annotation mark.")
                }
            }
            set {
                object[keyPath: storage]._value = newValue
            }
        }
}

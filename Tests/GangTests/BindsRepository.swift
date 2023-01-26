//
//  BindsRepository.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/26/23.
//

import Foundation
@testable import Gang

protocol BindsRepository: Initializable {
    var name: String { get set }
}

struct BindsRepositoryImpl: BindsRepository {
    var name: String = "hello binds"
}

protocol ProvidesRepository {
    var name: String { get set }
}

struct ProvidesRepositoryImpl: ProvidesRepository, Provide {
    var name: String = "hello provides"
}

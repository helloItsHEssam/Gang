//
//  DIContainer.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/26/23.
//

import Foundation
@testable import Gang

struct DIContainer: Initializable {
    init() {}

    @Binds(impl: BindsRepositoryImpl.self) var bindRepository: BindsRepository!
}

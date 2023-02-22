//
//  DIContainer.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/26/23.
//

import Foundation
@testable import Gang

final class DIContainer: Initializable, Container {
    init() {}

    @Binds(impl: BindsRepositoryImpl.self) var bindRepository: BindsRepository
}

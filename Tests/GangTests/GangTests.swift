//
//  GangTests.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/26/23.
//

import XCTest
@testable import Gang

final class GangTests: XCTestCase {

    @AppContainer(impl: DIContainer.self) private var container: DIContainer
    @Inject var bindRepo: BindsRepository!
    @Inject var provRepo: ProvidesRepository!

    override func tearDown() {
        bindRepo = nil
    }

    func testCheckBinds() {
        XCTAssertNotNil(bindRepo)
    }

    func testCheckFailBinds() {
        XCTAssertNil(provRepo)
    }
}

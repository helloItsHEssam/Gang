//
//  ProvidesTest.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/26/23.
//

import XCTest
@testable import Gang

final class ProvidesTest: XCTestCase {

    struct ProvidesRepositoryImpl2: Provide {}

    @Provides(data: {
        ProvidesRepositoryImpl()
    }) var provRepos: ProvidesRepository!
    @Provides(data: {
        ProvidesRepositoryImpl2()
    }) var provRepos2: ProvidesRepository!

    override func tearDown() {
        provRepos = nil
    }

    func testCheckBinds() {
        XCTAssertNotNil(provRepos)
    }

    func testContentImplBinds() {
        XCTAssertEqual(provRepos.name, "hello provides")
    }

    func testCheckFailBinds() {
        XCTAssertNil(provRepos2)
    }

}

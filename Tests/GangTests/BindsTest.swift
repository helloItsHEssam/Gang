//
//  BindsTest.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/26/23.
//

import XCTest
@testable import Gang

final class BindsTest: XCTestCase {

    struct BindsRepositoryImpl2: Initializable {}

    @Binds(impl: BindsRepositoryImpl.self) var bindRepos: BindsRepository!
    @Binds(impl: BindsRepositoryImpl2.self) var bindsRepos2: BindsRepository!

    override func tearDown() {
        bindRepos = nil
    }

    func testCheckBinds() {
        XCTAssertNotNil(bindRepos)
    }

    func testContentImplBinds() {
        XCTAssertEqual(bindRepos.name, "hello binds")
    }

    func testCheckFailBinds() {
        XCTAssertNil(bindsRepos2)
    }

}

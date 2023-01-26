//
//  MainContainerTest.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/26/23.
//

import XCTest
@testable import Gang

final class MainContainerTest: XCTestCase {

    private struct FirstDependency {
        var name: String = "hello world"
    }

    func testCheckNotFoundDependency() {
        do {
            let _: FirstDependency = try MainContainer.shared.resolve(key: "FirstDependency")

        } catch {
            XCTAssertEqual(error as? GangError, GangError.cannotFindYourDependency)
        }
    }

    func testAddDependency() {
        let first = FirstDependency()
        MainContainer.shared.register(dependency: first, key: "FirstDependency")

        do {
            let checkFirst: FirstDependency = try MainContainer.shared.resolve(key: "FirstDependency")
            XCTAssertNotNil(checkFirst)

        } catch {
            XCTAssertNil(error)
        }
    }

    func testRemoveDependency() {
        let first = FirstDependency()
        MainContainer.shared.register(dependency: first, key: "FirstDependency")
        MainContainer.shared.remove(key: "FirstDependency")

        do {
            let _: FirstDependency = try MainContainer.shared.resolve(key: "FirstDependency")

        } catch {
            XCTAssertNotNil(error)
        }
    }

}

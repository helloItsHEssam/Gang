//
//  AppContainerTest.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/26/23.
//

import XCTest
@testable import Gang

final class AppContainerTest: XCTestCase {

    @AppContainer(impl: DIContainer.self) private var container: DIContainer

    func testCheckCreateContainer() {
        XCTAssertNotNil(self.container)
    }

}

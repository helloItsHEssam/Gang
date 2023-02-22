//
//  ProvidesTest.swift
//  
//
//  Created by Hessam Mahdiabadi on 1/26/23.
//

import XCTest
@testable import Gang

final class ProvidesTest: XCTestCase, Container {
    
    struct ProvidesRepositoryImpl2: Provide {}
    
    @Provides(data: {
        ProvidesRepositoryImpl()
    })
    var provRepos: ProvidesRepository!
    @Provides(data: {
        ProvidesRepositoryImpl2()
    })
    var provRepos2: ProvidesRepository!
    
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
        expectFatalError(expectedMessage:
                            "We can not find your object to use. you probably made a mistake in your Binds annotation mark.")
        { [weak self] in
            guard let self = self else {
                return
            }
            
            XCTAssertNil(self.provRepos2)
        }
    }
}

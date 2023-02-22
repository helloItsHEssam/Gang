//
//  XCTestCase.swift
//  
//
//  Created by Hessam Mahdiabadi on 2/22/23.
//

import Foundation
import XCTest
@testable import Gang

extension XCTestCase {
    
//    internal var triggerFatalError = Swift.fatalError
    
    func expectFatalError(expectedMessage: String, testcase: @escaping () -> Void) {
        let expectation = self.expectation(description: "expectingFatalError")
        var assertionMessage: String = ""
        
        FatalErrorUtil.replaceFatalError { message, _, _ in
            assertionMessage = message
            DispatchQueue.main.async {
                expectation.fulfill()
            }
            Thread.exit()
            Swift.fatalError("will never be executed since thread exits")
        }
        
        Thread(block: testcase).start()
        
        waitForExpectations(timeout: 0.1) { _ in
            XCTAssertEqual(expectedMessage, assertionMessage)
            
            FatalErrorUtil.restoreFatalError()
        }
    }
}

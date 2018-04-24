//
//  ClosureCancellableTests.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.18.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import XCTest
@testable import BreathAnimation

class ClosureCancellableTests: XCTestCase {
    
    func test_cancel_performsCancelAction() {
        // arrange
        var cancelActionWasCalled = false
        let sut = ClosureCancellable {
            cancelActionWasCalled = true
        }
        // act
        sut.cancel()
        // assert
        XCTAssertTrue(cancelActionWasCalled)
    }
    
}

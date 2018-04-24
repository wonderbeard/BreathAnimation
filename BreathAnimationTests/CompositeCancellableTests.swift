//
//  CompositeCancellableTests.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.18.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import XCTest
@testable import BreathAnimation

class CompositeCancellableTests: XCTestCase {
    
    func test_cancel_performsCancelOnEveryComposable() {
        // arrange
        var cancellable1IsCalled = false
        let cancellable1 = ClosureCancellable {
            cancellable1IsCalled = true
        }
        var cancellable2IsCalled = false
        let cancellable2 = ClosureCancellable {
            cancellable2IsCalled = true
        }
        let sut = CompositeCancellable(cancellable1, cancellable2)
        // act
        sut.cancel()
        // assert
        XCTAssertTrue(cancellable1IsCalled && cancellable2IsCalled)
    }
    
}

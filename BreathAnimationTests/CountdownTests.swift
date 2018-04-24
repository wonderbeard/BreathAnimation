//
//  CountdownTests.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.18.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import XCTest
@testable import BreathAnimation

class CountdownTests: XCTestCase {
    
    var sut: Countdown!
    
    override func setUp() {
        sut = Countdown(duration: 0.1, interval: 0.01)
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_start_callsHandler_durationDividedByInterval_times() {
        // arrange
        let countdownFireExpectation = XCTestExpectation(description: "Countdown fire expectation")
        countdownFireExpectation.expectedFulfillmentCount = Int(sut.duration / sut.interval)
        // act
        sut.start { _ in
            countdownFireExpectation.fulfill()
        }
        // assert
        wait(for: [countdownFireExpectation], timeout: sut.duration)
    }
    
    func test_cancel_activeCountdown_finishCallingHandler() {
        // arrange
        let expectedDuration = 0.03
        let countdownFireExpectation = XCTestExpectation(description: "Partial countdown fire expectation")
        countdownFireExpectation.expectedFulfillmentCount = 4 // 0.1, 0.09, 0.08, 0.07
        // act
        let countdownSubscription = sut.start { _ in
            countdownFireExpectation.fulfill()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + expectedDuration) {
            countdownSubscription.cancel()
        }
        // assert
        wait(for: [countdownFireExpectation], timeout: expectedDuration)
    }
    
}

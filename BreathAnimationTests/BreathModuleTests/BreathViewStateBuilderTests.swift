//
//  BreathViewStateBuilderTests.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.18.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import XCTest
@testable import BreathAnimation

class BreathViewStateBuilderTests: XCTestCase {
    
    var sut: BreathViewStateBuilder!
    var viewMock: MockBreathViewInput!
    
    override func setUp() {
        super.setUp()
        sut = BreathViewStateBuilder()
        viewMock = MockBreathViewInput()
    }
    
    override func tearDown() {
        viewMock = nil
        sut = nil
        super.tearDown()
    }
    
    func test_setTitle_updateViewTitle_onApply() {
        // arrange
        let title = "I'm a very definite title"
        sut.setTitle(title)
        // act
        sut.getResult().apply(on: viewMock)
        // assert
        XCTAssertEqual(viewMock.animationTypeValues.last, title)
    }
    
    func test_setAnimationIndicatorColor_updatesIndicatorColor_onApply() {
        // arrange
        let animationColor = UIColor.red
        sut.setAnimationIndicatorColor(animationColor)
        // act
        sut.getResult().apply(on: viewMock)
        // assert
        XCTAssertEqual(viewMock.inidcatorColorValues.last, animationColor)
    }
    
    func test_setRemainingTimeText_updatesRemainingTimeText_onApply() {
        // arrange
        let remainingTimeText = "zero time"
        sut.setRemainingTimeText(remainingTimeText)
        // act
        sut.getResult().apply(on: viewMock)
        // assert
        XCTAssertEqual(viewMock.animationRemainingTimeValues.last, remainingTimeText)
    }
    
    func test_setRemainingTimeCountdown_updatesAnimationRemainingTimeSeveralTimes_onApply() {
        // arrange
        let countdown = Countdown(duration: 0.1, interval: 0.01)
        let formatter = CountdownMinutesAndSecondsFormatter()
        sut.setRemainingTimeCountdown(countdown, formatter: AnyMapper(formatter))
        let remainingTimeExpectation = XCTestExpectation(description: "Animation remaining time countdown expectation")
        remainingTimeExpectation.expectedFulfillmentCount = Int(countdown.duration / countdown.interval) + 1
        viewMock.onSetAnimationRemainingTime = { _ in
            remainingTimeExpectation.fulfill()
        }
        // act
        sut.getResult().apply(on: viewMock)
        // assert
        wait(for: [remainingTimeExpectation], timeout: countdown.duration)
    }
    
    func test_setTotalRemainingTimeText_updatesTotalRemainingTimeText_onApply() {
        // arrange
        let totalRemainingTime = "half an hour"
        sut.setTotalRemainingTimeText(totalRemainingTime)
        // act
        sut.getResult().apply(on: viewMock)
        // assert
        XCTAssertEqual(viewMock.totalRemainingTimeValues.last, totalRemainingTime)
    }
    
    func test_setAnimationIndicatorScale_udpatesIndicatorScale_onApply() {
        // arrange
        let scale: CGFloat = 0.3
        sut.setAnimationIndicatorScale(scale, transitionDuration: 0)
        // act
        sut.getResult().apply(on: viewMock)
        // assert
        XCTAssertEqual(viewMock.inidicatorScaleStateValues.last?.scale, scale)
    }
    
    func test_setUserInteractionEnabled_udpatesUserInteractionEnabled_onApply() {
        // arrange
        let enabled = false
        sut.setUserInteractionEnabled(enabled)
        // act
        sut.getResult().apply(on: viewMock)
        // assert
        XCTAssertEqual(viewMock.userInteractionEnabledValues.last, enabled)
    }
}

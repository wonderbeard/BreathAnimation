//
//  CompositeBreathViewStateTests.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.18.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import XCTest
@testable import BreathAnimation

class CompositeBreathViewStateTests: XCTestCase {
    
    func test_apply_callsApplyOnEveryComposable() {
        // arrange
        let mockState1 = MockBreathViewState()
        let mockState2 = MockBreathViewState()
        let sut = CompositeBreathViewState(mockState1, mockState2)
        // act
        sut.apply(on: MockBreathViewInput())
        // assert
        XCTAssertTrue(mockState1.isApplyCalled && mockState2.isApplyCalled)
    }
    
    func test_append_addsComposable() {
        // arrange
        let mockState = MockBreathViewState()
        var sut = CompositeBreathViewState()
        // act
        sut.append(mockState)
        sut.apply(on: MockBreathViewInput())
        // assert
        XCTAssertTrue(mockState.isApplyCalled)
    }
    
}

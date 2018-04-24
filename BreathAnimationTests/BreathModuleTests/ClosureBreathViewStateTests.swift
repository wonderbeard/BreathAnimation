//
//  ClosureBreathViewStateTests.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.18.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import XCTest
@testable import BreathAnimation

class ClosureBreathViewStateTests: XCTestCase {
    
    func test_apply_performsAction() {
        // arrange
        var actionWasPerformed = false
        let sut = ClosureBreathViewState { view in
            actionWasPerformed = true
        }
        // act
        sut.apply(on: MockBreathViewInput())
        // assert
        XCTAssertTrue(actionWasPerformed)
    }
    
}

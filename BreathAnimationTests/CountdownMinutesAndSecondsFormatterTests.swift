//
//  CountdownMinutesAndSecondsFormatterTests.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import XCTest
@testable import BreathAnimation

class CountdownMinutesAndSecondsFormatterTests: XCTestCase {
    
    var sut: CountdownMinutesAndSecondsFormatter!
    
    override func setUp() {
        super.setUp()
        sut = CountdownMinutesAndSecondsFormatter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_map_returnsMinutesAndSecondsStringSeparatedBySemicolon() {
        let oneMinuteTwentySeconds: TimeInterval = 80
        let oneMinuteTwentySecondsString = sut.map(oneMinuteTwentySeconds)
        XCTAssertEqual(oneMinuteTwentySecondsString, "01:20")
    }
    
}

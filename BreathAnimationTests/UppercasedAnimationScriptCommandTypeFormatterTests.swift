//
//  UppercasedAnimationScriptCommandTypeFormatterTests.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import XCTest
@testable import BreathAnimation

class UppercasedAnimationScriptCommandTypeFormatterTests: XCTestCase {
    
    var sut: UppercasedAnimationScriptCommandTypeFormatter!
    
    override func setUp() {
        super.setUp()
        sut = UppercasedAnimationScriptCommandTypeFormatter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_map_returnsUppercasedAnimationScriptCommandTypeRawValue() {
        let inhaleCommand = AnimationScript.Command(type: .inhale, duration: 0, color: .clear)
        let inhaleCommandString = sut.map(inhaleCommand)
        let expectedResult = inhaleCommand.type.rawValue.uppercased()
        XCTAssertEqual(expectedResult, inhaleCommandString)
    }
    
}

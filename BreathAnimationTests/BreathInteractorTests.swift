//
//  BreathInteractorTests.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import XCTest
@testable import BreathAnimation

class BreathInteractorTests: XCTestCase {
    
    var sut: BreathInteractor!
    
    override func setUp() {
        super.setUp()
        sut = BreathInteractor()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_runScript_performsProperly() {
        // arrange
        let commands: [AnimationScript.Command] = [
            .init(type: .inhale, duration: 0.2, color: .green),
            .init(type: .hold, duration: 0.3, color: .blue),
            .init(type: .exhale, duration: 0.2, color: .red)
        ]
        let mockOutput = MockBreathInteractorOutput()
        sut.output = mockOutput
        
        let inhaleExpectation = XCTestExpectation(description: "Inhale command")
        let holdExpectation = XCTestExpectation(description: "hold command")
        let exhaleExpectation = XCTestExpectation(description: "Exhale command")
        let finishExpectation = XCTestExpectation(description: "Script finish expectation")
        
        mockOutput.onDidStartCommand = { command in
            switch command.type {
            case .inhale:
                inhaleExpectation.fulfill()
            case .exhale:
                exhaleExpectation.fulfill()
            case .hold:
                holdExpectation.fulfill()
            }
        }
        
        mockOutput.onDidFinish = {
            finishExpectation.fulfill()
        }
        
        // act
        sut.runScript(AnimationScript(commands: commands))
        
        // assert
        wait(
            for: [inhaleExpectation, holdExpectation, exhaleExpectation, finishExpectation],
            timeout: 0.8,
            enforceOrder: true
        )
    }
    
}

//
//  BreathPresenterTests.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import XCTest
@testable import BreathAnimation

class BreathPresenterTests: XCTestCase {
    
    var sut: BreathPresenter!
    var viewStateFactoryMock: MockBreathViewStateFactory!
    var interactorMock: MockBreathInteractorInput!
    var viewMock: MockBreathViewInput!
    
    let scriptStub = AnimationScript(
        commands: [
            AnimationScript.Command(
                type: .inhale,
                duration: 2.0,
                color: .clear
            )
        ]
    )
    
    override func setUp() {
        super.setUp()
        sut = BreathPresenter()
        
        viewStateFactoryMock = MockBreathViewStateFactory()
        sut.viewStateFactory = viewStateFactoryMock
        
        interactorMock = MockBreathInteractorInput()
        sut.interactor = interactorMock
        
        viewMock = MockBreathViewInput()
        sut.view = viewMock
    }
    
    override func tearDown() {
        sut = nil
        interactorMock = nil
        viewMock = nil
        super.tearDown()
    }
    
    func test_setAnimationScript_updates_animationScriptProperty() {
        // act
        sut.setAnimationScript(scriptStub)
        // assert
        XCTAssertEqual(sut.animationScript, scriptStub)
    }
    
    func test_animate_runsScriptViaInteractor_when_setAnimationScriptWasCalledPreviously() {
        // act
        sut.setAnimationScript(scriptStub)
        sut.animate()
        // assert
        XCTAssertTrue(interactorMock.runnedScripts.contains(scriptStub))
    }
    
    func test_viewIsReady_appliesIdleStateWithNoDuration() {
        // arrange
        let idleStateMock = MockBreathViewState()
        let makeIdleStateExpectation = XCTestExpectation(description: "Make Idle State call")
        viewStateFactoryMock.onMakeIdleState = { duration in
            XCTAssertEqual(duration, 0)
            makeIdleStateExpectation.fulfill()
            return idleStateMock
        }
        // act
        sut.viewIsReady()
        // assert
        wait(for: [makeIdleStateExpectation], timeout: 0)
        XCTAssertTrue(idleStateMock.viewsAppliedOn.contains{ $0 === viewMock })
    }
    
    func test_test_didTapOnView_performsAnimationScript() {
        // arrange
        sut.setAnimationScript(scriptStub)
        // act
        sut.didTapOnView()
        // assert
        XCTAssertTrue(interactorMock.runnedScripts.contains(scriptStub))
    }
    
    func test_didStartScript_startsTotalRemainingTimeCountdown() {
        // arrange
        let countdownExpectation = XCTestExpectation(description: "Total remaining time countdown expectation")
        countdownExpectation.expectedFulfillmentCount = Int(scriptStub.duration) + 1
        viewMock.onSetTotalRemainingTime = { text in
            countdownExpectation.fulfill()
        }
        // act
        sut.didStartScript(scriptStub)
        // assert
        wait(for: [countdownExpectation], timeout: scriptStub.duration)
    }
    
    func test_didStartCommand_modifiesViewState() {
        // arrange
        let commandStateMock = MockBreathViewState()
        viewStateFactoryMock.onMakeStateForCommand = { _ in
            return commandStateMock
        }
        // act
        sut.didStartCommand(scriptStub.commands.first!)
        // assert
        XCTAssertTrue(commandStateMock.viewsAppliedOn.contains{ $0 === viewMock })
    }
    
    func test_didFinish_appliesIdleStateOnView() {
        // arrange
        let idleStateMock = MockBreathViewState()
        viewStateFactoryMock.onMakeIdleState = { _ in
            return idleStateMock
        }
        // act
        sut.didFinish()
        // assert
        XCTAssertTrue(idleStateMock.viewsAppliedOn.contains{ $0 === viewMock })
    }
    
}

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
    var interactorMock: MockBreathInteractorInput!
    var viewMock: MockBreathViewInput!
    
    override func setUp() {
        super.setUp()
        sut = BreathPresenter()
        interactorMock = MockBreathInteractorInput()
        viewMock = MockBreathViewInput()
        sut.interactor = interactorMock
        sut.view = viewMock
    }
    
    override func tearDown() {
        sut = nil
        interactorMock = nil
        viewMock = nil
        super.tearDown()
    }
    
    func test_animate_runsScriptViaInteractor_when_setAnimationScriptWasCalledBefore() {
        // arrange
        let script = AnimationScript.empty
        // act
        sut.setAnimationScript(script)
        sut.animate()
        // assert
        XCTAssertTrue(interactorMock.runnedScripts.contains(script))
    }
    
}

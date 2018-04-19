//
//  BreathViewControllerTests.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import XCTest
@testable import BreathAnimation

class BreathViewControllerTests: XCTestCase {
    
    var sut: BreathViewController!
    
    override func setUp() {
        super.setUp()
        sut = BreathViewController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_setAnimationType_updates_animationTypeLabel_text() {
        // arrange
        let animationTypeLabel = UILabel()
        sut.animationTypeLabel = animationTypeLabel
        // act
        let type = "Random type"
        sut.setAnimationType(type)
        // assert
        XCTAssertEqual(sut.animationTypeLabel.text, type)
    }
    
    func test_setAnimationRemainingTime_updates_animationRemainingTypeLabel_text() {
        // arrange
        let remainingTimeLabel = UILabel()
        sut.animationRemainingTimeLabel = remainingTimeLabel
        // act
        let remainingTime = "12 min"
        sut.setAnimationRemainingTime(remainingTime)
        // assert
        XCTAssertEqual(sut.animationRemainingTimeLabel.text, remainingTime)
    }
    
    func test_setIndicatorScale_transforms_animationIndicator() {
        // arrange
        let indicatorView = UIView()
        sut.animationIndicatorView = indicatorView
        // act
        let scale = 0.7 as CGFloat
        sut.setIndicatorScale(scale)
        // assert
        let expectedTransform = CGAffineTransform(scaleX: scale, y: scale)
        XCTAssertEqual(sut.animationIndicatorView.transform, expectedTransform)
    }
    
    func test_setIndicatorColor_updates_animationIndicator_backgroundColor() {
        // arrange
        let indicatorView = UIView()
        sut.animationIndicatorView = indicatorView
        // act
        let color = UIColor.green
        sut.setIndicatorColor(color)
        // assert
        XCTAssertEqual(sut.animationIndicatorView.backgroundColor, color)
    }
    
    func test_setTotalRemainingTime_updates_totalRemainingTimeLabel_text() {
        // arrange
        let remainingLabel = UILabel()
        sut.totalRemainingTimeLabel = remainingLabel
        // act
        let remaining = "32 min"
        sut.setTotalRemainingTime(remaining)
        // assert
        XCTAssertEqual(sut.totalRemainingTimeLabel.text, remaining)
    }
    
}

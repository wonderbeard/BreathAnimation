//
//  BreathViewControllerStoryboardTests.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import XCTest
@testable import BreathAnimation

class BreathViewControllerStoryboardTests: XCTestCase {
    
    var sut: UIStoryboard!
    
    override func setUp() {
        super.setUp()
        sut = UIStoryboard(name: "BreathViewController", bundle: .main)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_initialViewController_is_BreathViewController() {
        // act
        let initialVC = sut.instantiateInitialViewController()
        // assert
        XCTAssertTrue(initialVC is BreathViewController)
    }
    
    func test_all_BreathViewController_outlets_connected() {
        // arrange
        let breathVC = sut.instantiateInitialViewController() as! BreathViewController
        // act
        breathVC.loadViewIfNeeded()
        // assert
        XCTAssertNotNil(breathVC.animationTypeLabel)
        XCTAssertNotNil(breathVC.animationRemainingTimeLabel)
        XCTAssertNotNil(breathVC.animationIndicatorView)
        XCTAssertNotNil(breathVC.totalRemainingTimeLabel)
    }
    
}

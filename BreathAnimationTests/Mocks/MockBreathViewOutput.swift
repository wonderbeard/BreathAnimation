//
//  MockBreathViewOutput.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.18.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit
@testable import BreathAnimation

class MockBreathViewOutput: BreathViewOutput {
    
    private(set) var viewIsReadyCalled = false
    private(set) var didTapOnViewCalled = false
    
    func viewIsReady() {
        viewIsReadyCalled = true
    }
    
    func didTapOnView() {
        didTapOnViewCalled = true
    }
    
}

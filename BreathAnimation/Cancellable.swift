//
//  Cancellable.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

protocol Cancellable {
    func cancel()
}

struct ClosureCancellable: Cancellable {
    
    private let performCancel: () -> Void
    
    init(_ cancelAction: @escaping () -> Void) {
        performCancel = cancelAction
    }
    
    func cancel() {
        performCancel()
    }
    
}

struct CompositeCancellable: Cancellable {
    
    private let composables: [Cancellable]
    
    init(_ composables: Cancellable...) {
        self.composables = composables
    }
    
    func cancel() {
        composables.forEach{ $0.cancel() }
    }

}

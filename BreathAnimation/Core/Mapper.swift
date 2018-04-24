//
//  Mapper.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 20.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

protocol Mapper {
    associatedtype Input
    associatedtype Output
    func map(_ value: Input) -> Output
}

struct AnyMapper<Input, Output>: Mapper {
    
    private let permormMap: (Input) -> Output
    
    init<M: Mapper>(_ source: M) where M.Input == Input, M.Output == Output {
        self.init(mapping: source.map)
    }
    
    init(mapping: @escaping (Input) -> Output) {
        permormMap = mapping
    }
    
    func map(_ value: Input) -> Output {
        return permormMap(value)
    }
    
}

struct TransitMapper<Input, Output>: Mapper {
    
    private let performMap: (Input) -> Output
    
    init<M1: Mapper, M2: Mapper>(_ lhs: M1, _ rhs: M2) where M1.Input == Input, M1.Output == M2.Input, M2.Output == Output {
        performMap = { value in
            rhs.map(lhs.map(value))
        }
    }
    
    func map(_ value: Input) -> Output {
        return performMap(value)
    }
    
}

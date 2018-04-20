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

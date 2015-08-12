//
//  Counter.swift
//  NativeReduxCounter
//
//  Created by Benjamin Encz on 8/11/15.
//  Copyright © 2015 Benjamin Encz. All rights reserved.
//

import Foundation

struct Counter: Store {
    
    func handleAction(state: Int = 0, action:Action) -> Int {
        switch action {
        case .Increment:
            return state + 1
        case .Decrement:
            return state - 1
        case .Mount:
            return state
        }
    }
    
}
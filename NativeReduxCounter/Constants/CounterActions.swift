//
//  CounterActions.swift
//  NativeReduxCounter
//
//  Created by Benjamin Encz on 8/11/15.
//  Copyright © 2015 Benjamin Encz. All rights reserved.
//

import Foundation

struct CounterActions {
    
    func increment() -> Action {
        return Action.Increment
    }
    
    func decrement() -> Action {
        return Action.Decrement
    }
    
}
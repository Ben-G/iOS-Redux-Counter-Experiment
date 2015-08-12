//
//  CounterActions.swift
//  NativeReduxCounter
//
//  Created by Benjamin Encz on 8/11/15.
//  Copyright © 2015 Benjamin Encz. All rights reserved.
//

import Foundation

struct CounterActions {
    
    static func increment() -> ActionProvider {
        return { _ in
            return Action.Increment
        }
    }
    
    static func decrement() -> ActionProvider {
        return { _ in
            return Action.Decrement
        }
    }
    
    static func incrementIfOdd() -> ActionProvider {
        return { state in
            if (state % 2 == 0) {
                return nil
            }
            
            return Action.Increment
        }
    }
    
}
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
        return { state, _ in
            if (state % 2 == 0) {
                return nil
            }
            
            return Action.Increment
        }
    }
    
    static func incrementAfterDelay() -> ActionProvider {
        return { _, redux in
            delay(1.0) {
                redux.dispatch { CounterActions.increment() }
            }
            
            return nil
        }
    }
    
}


func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}
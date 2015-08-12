//
//  Redux.swift
//  NativeReduxCounter
//
//  Created by Benjamin Encz on 8/11/15.
//  Copyright © 2015 Benjamin Encz. All rights reserved.
//

import Foundation

class Redux {
    private init() {}
    
    private var counterState: Int = Counter().handleAction(action: Action.Mount)
    private var subscribers: [AnyReduxSubscriber<Int>] = []
    
    static let sharedInstance = Redux()
    
    func dispatch(action: Action) {
        // find store
        counterState = Counter().handleAction(counterState, action: action)
        // modify state with store action
        // update subscribers with new state
        for subscriber in subscribers {
            subscriber.newState(counterState)
        }
    }
    
    func subscribe<T: ReduxSubscriber where T.StoreType == Int>(subscriber: T) {
        subscribers.append(AnyReduxSubscriber(subscriber))
        subscriber.newState(counterState)
    }
    
}
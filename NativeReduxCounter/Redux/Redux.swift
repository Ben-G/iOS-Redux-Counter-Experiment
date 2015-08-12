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
    private var counterSubscribers: [AnyReduxSubscriber<Int>] = []
    
    static let sharedInstance = Redux()
    
    func dispatch(actionProvider: ActionProviderProvider) {
        // find store
        let action = actionProvider()(state: counterState)
        guard let providedAction = action else { return }
        
        counterState = Counter().handleAction(counterState, action: providedAction)
        // modify state with store action
        // update subscribers with new state
        for subscriber in counterSubscribers {
            subscriber.newState(counterState)
        }
    }
    
    func subscribeToCounter<T: ReduxSubscriber where T.StoreType == Int>(subscriber: T) {
        counterSubscribers.append(AnyReduxSubscriber(subscriber))
        subscriber.newState(counterState)
    }
    
    func getCounterState() -> Int {
        return counterState
    }
    
}

typealias ActionProviderProvider = () -> ActionProvider
typealias ActionProvider = (state: Int) -> Action?
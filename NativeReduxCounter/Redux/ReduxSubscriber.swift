//
//  ReduxSubscriber.swift
//  NativeReduxCounter
//
//  Created by Benjamin Encz on 8/11/15.
//  Copyright © 2015 Benjamin Encz. All rights reserved.
//

import Foundation

protocol ReduxSubscriber {
    typealias StoreType
    
    func newState(newState: StoreType)
}

struct AnyReduxSubscriber<StoreType>: ReduxSubscriber {
    private let _newState: (StoreType) -> Void
    
    init<Base: ReduxSubscriber where StoreType == Base.StoreType>(_ base: Base) {
        _newState = base.newState
    }
    
    func newState(newState: StoreType) { _newState(newState) }
}
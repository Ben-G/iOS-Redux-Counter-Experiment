//
//  Store.swift
//  NativeReduxCounter
//
//  Created by Benjamin Encz on 8/11/15.
//  Copyright © 2015 Benjamin Encz. All rights reserved.
//

import Foundation

protocol Store {
    typealias StoreType
    
    func handleAction(state: StoreType, action: Action) -> StoreType
}
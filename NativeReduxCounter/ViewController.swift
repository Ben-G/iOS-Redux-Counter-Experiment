//
//  ViewController.swift
//  NativeReduxCounter
//
//  Created by Benjamin Encz on 8/11/15.
//  Copyright © 2015 Benjamin Encz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Redux.sharedInstance.subscribeToCounter(self)
    }

    @IBAction func increment(sender: AnyObject) {
        Redux.sharedInstance.dispatch { CounterActions.increment() }
    }
    
    @IBAction func decrement(sender: AnyObject) {
        Redux.sharedInstance.dispatch { CounterActions.decrement() }
    }
    
    @IBAction func incrementIfOdd(sender: AnyObject) {
        Redux.sharedInstance.dispatch { CounterActions.incrementIfOdd() }
    }
    
    @IBAction func incrementAfterDelay(sender: AnyObject) {
        Redux.sharedInstance.dispatch { CounterActions.incrementAfterDelay() }
    }
    
}

extension ViewController: ReduxSubscriber {
    func newState(newState: Int) {
        counterLabel.text = ("\(newState)")
    }
}
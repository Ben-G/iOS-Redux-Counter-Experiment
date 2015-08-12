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
        
        Redux.sharedInstance.subscribe(self)
    }

    @IBAction func increment(sender: AnyObject) {
        Redux.sharedInstance.dispatch(Action.Increment)
    }
    
    @IBAction func decrement(sender: AnyObject) {
        Redux.sharedInstance.dispatch(Action.Decrement)
    }
    
}

extension ViewController: ReduxSubscriber {
    func newState(newState: Int) {
        counterLabel.text = ("\(newState)")
    }
}
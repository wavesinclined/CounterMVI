//
//  CounterViewRenderer.swift
//  CounterDemo
//
//  Created by alice singh on 23/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import Foundation

class CounterViewRenderer {
    var counterView: CounterView
    
    init(_ view: CounterView) {
        self.counterView = view
    }
    
    func renderState(_ state: CounterState) {
        let value = String(state.count)
        counterView.showValue(value)
    }
}

//
//  CounterModel.swift
//  CounterDemo
//
//  Created by alice singh on 23/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct CounterModel {
    
     static func bind(_ intentions: CounterIntentions, states: Observable<CounterState>)-> Observable<CounterState> {
        let minusIntention = intentions.didTapMinus
        let plusIntention = intentions.didTapPlus
        
        let initialState = Observable.just(CounterState(0))
        
        let incrementState = plusIntention.withLatestFrom(states) { ( _, state) -> CounterState in
            let previousCount = state.count
            print(previousCount)
            let newCount = previousCount + 1
            state.count = newCount
            return state
        }
        
        let decrementState = minusIntention.withLatestFrom(states) { ( _, state) -> CounterState in
            let previousCount = state.count
            print(previousCount)
            let newCount = previousCount - 1
            return CounterState(newCount)
        }
        
        return Observable.merge(initialState,incrementState,decrementState)
        
      }

}

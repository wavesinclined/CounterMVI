//
//  Intentions.swift
//  CounterDemo
//
//  Created by alice singh on 23/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CounterIntentions {
    var didTapPlus: Observable<Void>
    var didTapMinus: Observable<Void>
    
    init(_ didTapPlus: Observable<Void>, _ didTapMinus: Observable<Void>) {
        self.didTapMinus = didTapMinus
        self.didTapPlus = didTapPlus
    }
}

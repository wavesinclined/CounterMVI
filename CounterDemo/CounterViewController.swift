//
//  CounterViewController.swift
//  CounterDemo
//
//  Created by alice singh on 23/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ChameleonFramework

class CounterViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    let states = BehaviorRelay<CounterState>(value: CounterState(0))
    let disposeBag = DisposeBag()
    lazy var intention: CounterIntentions = {
        return CounterIntentions(addButton.rx.tap.asObservable(), minusButton.rx.tap.asObservable())
    }()
    lazy var viewRenderer: CounterViewRenderer = {
        return CounterViewRenderer(self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToModel()
    }
    
    func bindToModel() {
        let currentState =  CounterModel.bind(intention, states: states.asObservable())
        _ = currentState.subscribe(onNext: { (state) in
            self.states.accept(state)
            self.viewRenderer.renderState(state)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
    }
}

extension CounterViewController: CounterView {
    func showValue(_ value: String) {
        counterLabel.text = value
    }
}

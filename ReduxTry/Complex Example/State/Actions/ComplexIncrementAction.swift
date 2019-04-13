//
//  ComplexIncrementAction.swift
//  ReduxTry
//
//  Created by NFlahavan on 4/5/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

// Call usecase instead of action
// Getting away from word usecase. Leave as is for now.
struct ComplexIncrementAction {
  static let INCREMENT = "INCREMENT"

  private let storeDispatchFunc: (Action) -> Void

  private let actionReducerMap: [String: ((ComplexViewState, Action) -> ComplexViewState)] = {
    return [
      IncrementAction.INCREMENT: { (state: ComplexViewState, action: Action) -> ComplexViewState in
        var newState = state
        newState.count += 1
        return newState
      }
    ]
  }()

  init(storeDispatchFunc: @escaping (Action) -> Void, viewReducer: ViewReducer<ComplexViewState>) {
    self.storeDispatchFunc = storeDispatchFunc
    viewReducer.addActionReducersMap(map: actionReducerMap)
  }

  func dispatch() {
    let action = Action(type: IncrementAction.INCREMENT, payload: nil)
    storeDispatchFunc(action)
  }
}

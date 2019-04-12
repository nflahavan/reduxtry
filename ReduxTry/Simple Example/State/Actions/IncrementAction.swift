//
//  IncrementAction.swift
//  ReduxTry
//
//  Created by NFlahavan on 4/5/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

// Call usecase instead of action
// Getting away from word usecase. Leave as is for now.
struct IncrementAction {
  static let INCREMENT = "INCREMENT"

  private let storeDispatchFunc: (Action) -> Void

  private let actionReducerMap: [String: ((Int, Action) -> Int)] = {
    return [
      IncrementAction.INCREMENT: { (state: Int, action: Action) -> Int in
        return state + 1
      }
    ]
  }()

  init(storeDispatchFunc: @escaping (Action) -> Void, viewReducer: ViewReducer<Int>) {
    self.storeDispatchFunc = storeDispatchFunc
    viewReducer.addActionReducersMap(map: actionReducerMap)
  }

  func dispatch() {
    let action = Action(type: IncrementAction.INCREMENT, payload: nil)
    storeDispatchFunc(action)
  }
}

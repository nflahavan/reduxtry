//
//  IncrementAction.swift
//  ReduxTry
//
//  Created by NFlahavan on 4/5/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

struct IncrementAction {
  static let INCREMENT = "INCREMENT"

  private let storeDispatchFunc: (Action<Void>) -> Void

  private let actionReducerMap: [String: ((Int, ActionProtocol) -> Int)] = {
    return [
      IncrementAction.INCREMENT: { (state: Int, action: ActionProtocol) -> Int in
        return state + 1
      }
    ]
  }()

  init(storeDispatchFunc: @escaping (Action<Void>) -> Void, viewReducer: ViewReducer<Int>) {
    self.storeDispatchFunc = storeDispatchFunc
    viewReducer.addActionReducersMap(map: actionReducerMap)
  }

  func dispatch() {
    let action = Action(type: IncrementAction.INCREMENT, payload: ())
    storeDispatchFunc(action)
  }
}

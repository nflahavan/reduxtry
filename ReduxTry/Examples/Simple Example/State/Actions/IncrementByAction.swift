//
//  IncrementByAction.swift
//  ReduxTry
//
//  Created by NFlahavan on 4/5/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

// Call usecase instead of action
// Getting away from word usecase. Leave as is for now.
struct IncrementByAction {
  static let INCREMENT_BY = "INCREMENT_BY"

  private let storeDispatchFunc: (Action) -> Void

  private let actionReducerMap: [String: ((Int, Action) -> Int)] = {
    return [
      IncrementByAction.INCREMENT_BY: { (state: Int, action: Action) -> Int in
        let payload = action.payload as! Int
        print("payload: \(payload)")

        return state + payload
      }
    ]
  }()

  init(storeDispatchFunc: @escaping (Action) -> Void, viewReducer: ViewReducer<Int>) {
    self.storeDispatchFunc = storeDispatchFunc
    viewReducer.addActionReducersMap(map: actionReducerMap)
  }

  func dispatch(payload: Int) {
    let action = Action(type: IncrementByAction.INCREMENT_BY, payload: payload)
    storeDispatchFunc(action)
  }
}

//
//  ViewReducer.swift
//  ReduxTry
//
//  Created by NFlahavan on 4/5/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

class ViewReducer<ViewState>: ViewReducerProtocol {
  typealias State = ViewState

  var actionReducersMap: [String: ((ViewState, Action) -> ViewState)] = [:]

  func reduce(state: ViewState, action: Action) -> ViewState {
    print("reducing \(action.type)")
    guard let actionReducer = actionReducersMap[action.type] else {
      print("No actionReducer found.")
      return state
    }

    return actionReducer(state, action)
  }

  func addActionReducersMap(map: [String: ((ViewState, Action) -> ViewState)]) {
    for keyValuePair in map {
      print("adding \(keyValuePair.key) to actionReducerMap")
      self.actionReducersMap[keyValuePair.key] = keyValuePair.value
    }
  }
}

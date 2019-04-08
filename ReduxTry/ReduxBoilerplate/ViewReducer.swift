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

  var actionReducersMap: [String: ((ViewState, ActionProtocol) -> ViewState)] = [:]

  func reduce(state: ViewState, action: ActionProtocol) -> ViewState {
    guard let actionReducer = actionReducersMap[action.type] else {
      print("No actionReducer found.")
      return state
    }

    return actionReducer(state, action)
  }

  func addActionReducersMap(map: [String: ((ViewState, ActionProtocol) -> ViewState)]) {
    for keyValuePair in map {
      self.actionReducersMap[keyValuePair.key] = keyValuePair.value
    }
  }
}

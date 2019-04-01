//
//  CustomerViewReducer.swift
//  ReduxTry
//
//  Created by NFlahavan on 3/29/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

class CustomerViewReducer {

  var actionReducersMap: [String: AnyActionReducer<CustomerViewState>]

  init() {
    self.actionReducersMap = [:]
  }

  func reduce(state: CustomerViewState, action: Action<CustomerViewState>) -> CustomerViewState {
    guard let actionReducer = actionReducersMap[action.type] else {
      print("No actionReducer found.")
      return state
    }

    return actionReducer.reduce(state: state, action: action)
  }

  func addActionReducersMap(map: [String: AnyActionReducer<CustomerViewState>]) {
    for keyValuePair in map {
      self.actionReducersMap[keyValuePair.key] = keyValuePair.value
    }
  }
}

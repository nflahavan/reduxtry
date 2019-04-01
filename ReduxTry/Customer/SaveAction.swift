//
//  SaveAction.swift
//  ReduxTry
//
//  Created by NFlahavan on 3/29/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

struct SaveAction {
  static let SAVE = "SAVE"
//  let map: [:]

  func saveAction(payload: Customer) -> Action<Customer> {
    return Action(type: SaveAction.SAVE, payload: payload)
  }

  func saveActionReducer(state: CustomerViewState, action: Action<Customer>) -> CustomerViewState {
    var newState = state
    newState.saveState = .isSaving
    // worker stuff
    return newState
  }

  func saveActionWorker(state: CustomerViewState, action: Action<Customer>, dispatch: @escaping () -> Void) {
    var newState = state
    // perform side effect stuff.
    newState.saveState = .isSaved
    // fire off a saveSuccessful action
  }
}

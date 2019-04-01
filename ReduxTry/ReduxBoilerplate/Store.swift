//
//  Store.swift
//  ReduxTry
//
//  Created by NFlahavan on 3/29/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

class Store<State> {
  var state: State
  var viewReducer: AnyViewReducer<State>

  init(initialState: State, viewReducer: AnyViewReducer<State>) {
    self.state = initialState
    self.viewReducer = viewReducer
  }

  func getstate() -> State {
    return state
  }

  func dispatch(action: ActionProtocol) {
    // Add to queue
    // process queue async (all on one thread right now)
    let newState = viewReducer.reduce(state: self.state, action: action)
    // compare
    // if newState == state { don't do anything } else {
    self.state = newState
    // notify watchers
    // notify viewController or maybe call VC's refresh method? tbd
  }
}

//
//  Store.swift
//  ReduxTry
//
//  Created by NFlahavan on 3/29/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

class Store<State> {
  private var state: State
  private var viewReducer: AnyViewReducer<State>
  private var viewRefresh: (State) -> Void

  init(initialState: State, viewReducer: AnyViewReducer<State>, viewRefresh: @escaping (State) -> Void) {
    self.state = initialState
    self.viewReducer = viewReducer
    self.viewRefresh = viewRefresh
  }

  func getstate() -> State {
    return self.state
  }

  func dispatch(action: Action) {
    // Add to queue
    // process queue async (all on one thread right now)
    print("dispatching \(action.type)")
    let newState = viewReducer.reduce(state: self.state, action: action)
    // compare
    // if newState == state { don't do anything } else {
    self.state = newState
    // notify watchers
    self.viewRefresh(self.state)
  }
}

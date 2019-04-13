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
  private var viewRefresh: (State, State) -> Void

  init(initialState: State, viewReducer: AnyViewReducer<State>, viewRefresh: @escaping (State, State) -> Void) {
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
    let prevState = self.state
    self.state = viewReducer.reduce(state: prevState, action: action)
    // notify watchers
    self.viewRefresh(prevState, self.state)
  }
}

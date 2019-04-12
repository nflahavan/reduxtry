//
//  ViewReducerProtocol.swift
//  ReduxTry
//
//  Created by NFlahavan on 3/29/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

protocol ViewReducerProtocol {
  associatedtype State
  func reduce(state: State, action: Action) -> State
}

private class _AnyViewReducer<State>: ViewReducerProtocol {
  init() {
    guard type(of: self) != _AnyViewReducer.self else {
      fatalError("AnyValidationRule<FormValue> instances cannot be created. Create a subclass instance instead.")
    }
  }

  func reduce(state: State, action: Action) -> State {
    fatalError()
  }
}

private final class _AnyViewReducerBox<Concrete: ViewReducerProtocol>: _AnyViewReducer<Concrete.State> {
  var concrete: Concrete

  init(_ concrete: Concrete) {
    self.concrete = concrete
  }

  override func reduce(state: Concrete.State, action: Action) -> Concrete.State {
    return concrete.reduce(state: state, action: action)
  }
}

final class AnyViewReducer<State>: ViewReducerProtocol {
  private let box: _AnyViewReducer<State>

  init<Concrete: ViewReducerProtocol>(_ concrete: Concrete) where Concrete.State == State {
    box = _AnyViewReducerBox(concrete)
  }

  func reduce(state: State, action: Action) -> State {
    return box.reduce(state: state, action: action)
  }
}

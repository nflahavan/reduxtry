//
//  ActionReducerProtocol.swift
//  ReduxTry
//
//  Created by NFlahavan on 3/29/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

//protocol ActionReducerProtocol {
//  associatedtype State
//  func reduce(state: State, action: ActionProtocol) -> State
//}
//
//private class _AnyActionReducer<State>: ActionReducerProtocol {
//  init() {
//    guard type(of: self) != _AnyActionReducer.self else {
//      fatalError("AnyValidationRule<FormValue> instances cannot be created. Create a subclass instance instead.")
//    }
//  }
//
//  func reduce(state: State, action: ActionProtocol) -> State {
//    fatalError()
//  }
//}
//
//private final class _AnyActionReducerBox<Concrete: ActionReducerProtocol>: _AnyActionReducer<Concrete.State> {
//  var concrete: Concrete
//
//  init(_ concrete: Concrete) {
//    self.concrete = concrete
//  }
//
//  override func reduce(state: Concrete.State, action: ActionProtocol) -> Concrete.State {
//    return concrete.reduce(state: state, action: action)
//  }
//}
//
//final class AnyActionReducer<State>: ActionReducerProtocol {
//  private let box: _AnyActionReducer<State>
//
//  init<Concrete: ActionReducerProtocol>(_ concrete: Concrete) where Concrete.State == State {
//    box = _AnyActionReducerBox(concrete)
//  }
//
//  func reduce(state: State, action: ActionProtocol) -> State {
//    return box.reduce(state: state, action: action)
//  }
//
//  //  func validate(formValue: FormValue) -> Bool {
//  //    return box.validate(formValue: formValue)
//  //  }
//}

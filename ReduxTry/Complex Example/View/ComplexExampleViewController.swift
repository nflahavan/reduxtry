//
//  ComplexExampleViewController.swift
//  ReduxTry
//
//  Created by NFlahavan on 4/12/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import UIKit

class ComplexExampleViewController: UIViewController {

  @IBOutlet weak var buttonLabel: UILabel!
  @IBOutlet weak var button: NSLayoutConstraint!
  @IBOutlet weak var customerSegmentedControl: UISegmentedControl!

  private var viewReducer: ViewReducer<ComplexViewState>!
  private var store: Store<ComplexViewState>!
  private var incrementAction: ComplexIncrementAction!

  private let customers = [Customer(firstName: "Bob", lastName: "Bobbert"),
                           Customer(firstName: "Jill", lastName: "Jillenholl")]

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    let initialState = ComplexViewState(count: 0, customer: customers[0])

    viewReducer = ViewReducer()
    store = Store(initialState: initialState, viewReducer: AnyViewReducer(viewReducer),
                  viewRefresh: refresh(prevState:state:))

    incrementAction = ComplexIncrementAction(storeDispatchFunc: store.dispatch(action:), viewReducer: viewReducer)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @IBAction func buttonTouched(_ sender: Any) {
    incrementAction.dispatch()
  }

  @IBAction func customerSegmentedControlValueChanged(_ sender: UISegmentedControl) {
  }
  
  func refresh(prevState: ComplexViewState, state: ComplexViewState) {
    print("state: \(state.customer.self), prevState: \(prevState.customer.self)")
    buttonLabel.text = "button pressed \(state.count) times."
  }
}

//
//  ExampleViewController.swift
//  ReduxTry
//
//  Created by NFlahavan on 4/5/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
  @IBOutlet weak var buttonLabel: UILabel!
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var incrementBy: UIButton!

  private var viewReducer: ViewReducer<Int>!
  private var store: Store<Int>!
  private var incrementAction: IncrementAction!
  private var incrementByAction: IncrementByAction!

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    viewReducer = ViewReducer()
    store = Store(initialState: 0, viewReducer: AnyViewReducer(viewReducer), viewRefresh: refresh(prevState:state:))

    incrementAction = IncrementAction(storeDispatchFunc: store.dispatch(action:), viewReducer: viewReducer)
    incrementByAction = IncrementByAction(storeDispatchFunc: store.dispatch(action:), viewReducer: viewReducer)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @IBAction func buttonTouched(_ sender: Any) {
    incrementAction.dispatch()
  }

  @IBAction func incrementByButtonTouched(_ sender: Any) {
    print("incrementByButtonTouched")
    incrementByAction.dispatch(payload: 2)
  }
  
  func refresh(prevState: Int, state: Int) {
    buttonLabel.text = "button pressed \(state) times."
  }
}

//
//  RootViewController.swift
//  ReduxTry
//
//  Created by NFlahavan on 4/5/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
  @IBOutlet weak var buttonLabel: UILabel!
  @IBOutlet weak var button: UIButton!

  private var viewReducer: ViewReducer<Int>
  private var store: Store<Int>!
  private var incrementAction: IncrementAction!

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    viewReducer = ExampleViewReducer()

    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    store = Store(initialState: 0, viewReducer: AnyViewReducer(viewReducer), viewRefresh: refresh(count: ))
    incrementAction = IncrementAction(storeDispatchFunc: store.dispatch(action:), viewReducer: viewReducer)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @IBAction func buttonTouched(_ sender: Any) {
    incrementAction.dispatch()
  }

  func refresh(count: Int) {
    buttonLabel.text = "button pressed \(count) times."
  }
}

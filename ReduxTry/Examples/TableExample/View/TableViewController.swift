//
//  TableViewController.swift
//  ReduxTry
//
//  Created by NFlahavan on 5/30/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

  private var viewReducer: ViewReducer<TableViewState>!
  private var store: Store<TableViewState>!
  private var randomizeAction: RandomizeAction!
  private var loadDataAction: LoadDataAction!
  private var tableHelper: TableHelper!

  override func viewDidLoad() {

    super.viewDidLoad()

    setupTable()
    setupRedux()
    addButtonToNavigationController()

  }

  func setupTable() {

    tableView.dataSource = self
    tableView.delegate = self

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    tableHelper = TableHelper(table: tableView, updateFunc: { a,b,c in })

  }

  func setupRedux() {

    let initialViewState = TableViewState(tableData: [])

    viewReducer = ViewReducer()
    store = Store(initialState: initialViewState, viewReducer: AnyViewReducer(viewReducer), viewRefresh: refresh(prevState:state:))
    randomizeAction = RandomizeAction(storeDispatchFunc: store.dispatch(action:), viewReducer: viewReducer)
    loadDataAction = LoadDataAction(storeDispatchFunc: store.dispatch(action:), viewReducer: viewReducer)

  }

  func refresh(prevState: TableViewState, state: TableViewState) {

    print("refresh.")
    tableHelper.updateTable(from: Set(prevState.tableData), to: Set(state.tableData), completionHandler: { a in })

  }

  func addButtonToNavigationController() {

    let button = UIButton(type: .roundedRect)
    button.setTitle("load data", for: .normal)

    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    navigationItem.titleView = button

  }

  @objc func buttonTapped() {

    print("button tapped.")
    //randomizeAction.dispatch()
    loadDataAction.dispatch()

  }
}

// MARK: UITableViewDataSource

extension TableViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    let numRows = store.getstate().tableData.count
    print("numRows: \(numRows)")
    return numRows

  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

    let tableDatas = store.getstate().tableData
    let tableData = tableDatas.first(where: { tableData in return tableData.indexPath == indexPath })
    let emoji = tableData?.data as? String

    if let emoji = emoji {

      cell.textLabel?.text = String(emoji)
      
    }

    return cell

  }

}

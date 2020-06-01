//
//  RandomizeAction.swift
//  ReduxTry
//
//  Created by NFlahavan on 5/31/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

struct LoadDataAction {

  static let LOAD_DATA = "LOAD_DATA"

  private static var isFirst = true

  private let storeDispatchFunc: (Action) -> Void

  private let actionReducerMap: [String: ((TableViewState, Action) -> TableViewState)] = {

    return [

      LoadDataAction.LOAD_DATA : { (state: TableViewState, action: Action) -> TableViewState in

        print("randomize.")

        if isFirst {

          let randomNumber = Int.random(in: 0...10)

          var tableDatas: [TableRowData] = []

          for index in 0..<3 {

            let tableData = TableRowData(indexPath: IndexPath(row: index, section: 0), data: "\(index)")
            tableDatas.append(tableData)

          }

          isFirst = false

          return TableViewState(tableData: tableDatas)

        } else {

          var tableData = state.tableData

          tableData[0].indexPath = IndexPath(row: 2, section: 0)
          tableData[2].indexPath = IndexPath(row: 0, section: 0)

          return TableViewState(tableData: tableData)

        }
      }
    ]
  }()

  init(storeDispatchFunc: @escaping (Action) -> Void, viewReducer: ViewReducer<TableViewState>) {

    self.storeDispatchFunc = storeDispatchFunc
    viewReducer.addActionReducersMap(map: actionReducerMap)

  }

  func dispatch() {

    let action = Action(type: LoadDataAction.LOAD_DATA, payload: nil)
    storeDispatchFunc(action)

  }

}

//
//  RandomizeAction.swift
//  ReduxTry
//
//  Created by NFlahavan on 5/31/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

struct RandomizeAction {

  static let RANDOMIZE = "RANDOMIZE"

  private static let emojis = "😂😈🤰🤴🙅🤩👺👨‍❤️‍💋‍👨👩‍❤️‍👩🧚"

  private let storeDispatchFunc: (Action) -> Void

  private let actionReducerMap: [String: ((TableViewState, Action) -> TableViewState)] = {

    return [

      RandomizeAction.RANDOMIZE : { (state: TableViewState, action: Action) -> TableViewState in

        print("randomize.")

        let randomNumber = Int.random(in: 0...10)

        var tableDatas: [TableData] = []

        for index in 0..<randomNumber {

          let emoji = emojis.randomElement()!
          let tableData = TableData(indexPath: IndexPath(row: index, section: 0), data: emoji)
          tableDatas.append(tableData)

        }

        return TableViewState(tableData: tableDatas)

      }

    ]

  }()

  init(storeDispatchFunc: @escaping (Action) -> Void, viewReducer: ViewReducer<TableViewState>) {

    self.storeDispatchFunc = storeDispatchFunc
    viewReducer.addActionReducersMap(map: actionReducerMap)

  }

  func dispatch() {

    let action = Action(type: RandomizeAction.RANDOMIZE, payload: nil)
    storeDispatchFunc(action)

  }

}

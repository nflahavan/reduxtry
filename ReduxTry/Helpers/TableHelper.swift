//
//  TableHelper.swift
//  ReduxTry
//
//  Created by NFlahavan on 4/19/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import UIKit

enum TableHelper {

  static func update(_ table: UITableView,
                     from prevTableData: Set<TableData>,
                     to currTableData: Set<TableData>,
                     using updateFunc: (UITableView, TableData, TableData) -> Void) {
    let prunedPrevTableData = prevTableData.intersection(currTableData)

    let deletionIndices = prevTableData.subtracting(prunedPrevTableData).map { item in return item.indexPath }
    let insertionIndices = currTableData.subtracting(prunedPrevTableData).map { item in return item.indexPath }

    let indexPathSortPredicate = { (lhs: TableData, rhs: TableData) -> Bool in lhs.indexPath < rhs.indexPath }

    let prunedAndSortedPrevTableData = prunedPrevTableData.sorted(by: indexPathSortPredicate)
    let prunedAndSortedCurrTableData = currTableData.intersection(prevTableData).sorted(by: indexPathSortPredicate)
    var moveIndices: [(from: IndexPath, to: IndexPath)] = []

    for index in prunedAndSortedPrevTableData.indices {
      let prevItem = prunedAndSortedPrevTableData[index]
      let currItem: TableData

      if prunedAndSortedCurrTableData[index] != prevItem {
        guard let currItemIndex = prunedAndSortedCurrTableData.firstIndex(of: prevItem) else {
          fatalError("prunedAndSortedCurrTableData doesn't contain \(prevItem).")
        }

        currItem = prunedAndSortedCurrTableData[currItemIndex]
        moveIndices.append((from: prevItem.indexPath, to: currItem.indexPath))
      } else {
        currItem = prunedAndSortedCurrTableData[index]
      }

      updateFunc(table, prevItem, currItem)
    }

    table.beginUpdates()
    table.deleteRows(at: deletionIndices, with: .automatic)

    for item in moveIndices {
      table.moveRow(at: item.from, to: item.to)
    }

    table.insertRows(at: insertionIndices, with: .automatic)
    table.endUpdates()
  }
}

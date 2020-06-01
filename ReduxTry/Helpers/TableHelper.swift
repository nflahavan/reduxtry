//  Created by NFlahavan on 5/29/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import UIKit

class TableHelper {

  private(set) weak var table: UITableView!

  let updateFunc: (UITableView, TableRowData, TableRowData) -> Void

  private var rowsToDelete: [IndexPath] = []
  private var rowsToInsert: [IndexPath] = []
  private var rowsToMove: [(oldIndex: IndexPath, newIndex: IndexPath)] = []
  private var batchUpdates: () -> Void {

    return { [weak self] in

      guard let self = self else { return }

      self.table.deleteRows(at: self.rowsToDelete, with: .right)
      self.table.insertRows(at: self.rowsToInsert, with: .left)

      for row in self.rowsToMove {

        self.table.moveRow(at: row.oldIndex, to: row.newIndex)

      }
    }
  }

  init(table: UITableView, updateFunc: @escaping (UITableView, TableRowData, TableRowData) -> Void) {

    self.table = table
    self.updateFunc = updateFunc

  }

  func updateTable(from prevTableData: Set<TableRowData>, to currTableData: Set<TableRowData>, completionHandler: @escaping (Bool) -> Void) {

    let rowsToDeleteOrInsert = currTableData.symmetricDifference(prevTableData)
    let prevRowsStickingAround = prevTableData.intersection(currTableData).sorted()
    let currRowsStickingAround = currTableData.intersection(prevTableData).sorted()

    rowsToDelete = rowsToDeleteOrInsert.intersection(prevTableData).map { data in return data.indexPath }
    rowsToInsert = rowsToDeleteOrInsert.intersection(currTableData).map { data in return data.indexPath }
    rowsToMove = []

    for index in currRowsStickingAround.indices {

      let prevRow = prevRowsStickingAround[index]
      let currRow = currRowsStickingAround[index]

      if prevRow.indexPath != currRow.indexPath {

        rowsToMove.append((oldIndex: prevRow.indexPath, currRow.indexPath))

      }

      updateFunc(table, prevRow, currRow)

    }

    table.performBatchUpdates(batchUpdates, completion: completionHandler)

  }
}

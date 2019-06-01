//
//  TableData.swift
//  ReduxTry
//
//  Created by NFlahavan on 4/20/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import UIKit

struct TableRowData {

  let id: UUID
  var indexPath: IndexPath
  var data: AnyHashable

  init<T: Hashable>(indexPath: IndexPath, data: T, id: UUID = UUID()) {

    self.id = id
    self.data = data
    self.indexPath = indexPath

  }
}

extension TableRowData: Hashable {

  static func == (lhs: TableRowData, rhs: TableRowData) -> Bool {

    return lhs.id == rhs.id

  }

  func hash(into hasher: inout Hasher) {

    hasher.combine(id)

  }

}

extension TableRowData: Comparable {
  static func < (lhs: TableRowData, rhs: TableRowData) -> Bool {

    return lhs.indexPath < rhs.indexPath

  }

}

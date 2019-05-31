//
//  TableData.swift
//  ReduxTry
//
//  Created by NFlahavan on 4/20/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import UIKit

struct TableData {

  let id: UUID
  var indexPath: IndexPath
  var data: AnyHashable

  init<T: Hashable>(indexPath: IndexPath, data: T, id: UUID = UUID()) {

    self.id = id
    self.data = data
    self.indexPath = indexPath

  }
}

extension TableData: Hashable {

  static func == (lhs: TableData, rhs: TableData) -> Bool {

    return lhs.id == rhs.id
    
  }

}

extension TableData: Comparable {
  static func < (lhs: TableData, rhs: TableData) -> Bool {

    return lhs.indexPath < rhs.indexPath

  }



}

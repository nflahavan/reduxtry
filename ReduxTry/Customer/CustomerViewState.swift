//
//  CustomerViewState.swift
//  ReduxTry
//
//  Created by NFlahavan on 3/29/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

struct CustomerViewState {
  var isEditing: Bool
  var saveState: SaveState
  var customer: Customer
}

enum SaveState {
  case isSaving
  case isSaved
  case isPrestine
  case isDirty
}

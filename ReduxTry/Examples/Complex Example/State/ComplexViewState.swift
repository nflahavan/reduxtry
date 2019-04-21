//
//  ComplexViewState.swift
//  ReduxTry
//
//  Created by NFlahavan on 4/12/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

struct ComplexViewState {
  var count: Int
  var customer: Customer
}

class Customer {
  let firstName: String
  let lastName: String

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

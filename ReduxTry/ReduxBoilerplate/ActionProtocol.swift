//
//  ActionProtocol.swift
//  ReduxTry
//
//  Created by NFlahavan on 3/29/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

protocol ActionProtocol {
  var type: String { get }
}

struct Action<T>: ActionProtocol {
  let type: String
  let payload: T
}

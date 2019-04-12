//
//  ActionProtocol.swift
//  ReduxTry
//
//  Created by NFlahavan on 3/29/19.
//  Copyright © 2019 NFlahavan. All rights reserved.
//

import Foundation

protocol PayloadProtocol {}

extension Int: PayloadProtocol {}
//...

//protocol ActionProtocol {
//  var type: String { get }
//  var payload: PayloadProtocol? { get }
//}

struct Action {
  let type: String
  let payload: PayloadProtocol?
}

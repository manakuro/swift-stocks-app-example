//
//  Stock.swift
//  StocksAppSwiftUI
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

struct Stock: Decodable {
  let symbol: String
  let description: String
  let price: Double
  let change: String
}

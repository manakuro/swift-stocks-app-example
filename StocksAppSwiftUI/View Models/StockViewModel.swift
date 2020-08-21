//
//  StockViewModel.swift
//  StocksAppSwiftUI
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

struct StockViewModel {
  let stock: Stock
  
  var symbol: String {
    self.stock.symbol.uppercased()
  }
  
  var description: String {
    self.stock.description
  }
  
  var price: String {
    String(format: "%.2f", self.stock.price)
  }
  
  var change: String {
    self.stock.change
  }
}

//
//  StockListViewModel.swift
//  StocksAppSwiftUI
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

class StockListViewModel: ObservableObject {
  @Published var searchTerm: String = ""
  @Published var stocks: [StockViewModel] = [StockViewModel]()
  
  var filteredStocks: [StockViewModel] {
    self.searchTerm.isEmpty ? self.stocks : self.stocks.filter { $0.symbol.starts(with: self.searchTerm) }
  }
  
  func load() {
    fetchStocks()
  }
  
  private func fetchStocks() {
    Webservice().fetchStocks() { stocks in
      if let stocks = stocks {
        DispatchQueue.main.async {
          self.stocks = stocks.map(StockViewModel.init)
        }
      }
    }
  }
}

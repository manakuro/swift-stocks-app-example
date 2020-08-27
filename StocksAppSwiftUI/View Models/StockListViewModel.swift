//
//  StockListViewModel.swift
//  StocksAppSwiftUI
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {
  @Published var dragOffset: CGSize = CGSize(width: 0, height: 680)
  @Published var searchTerm: String = ""
  @Published var stocks: [StockViewModel] = [StockViewModel]()
  @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
  
  var filteredStocks: [StockViewModel] {
    self.searchTerm.isEmpty ? self.stocks : self.stocks.filter { $0.symbol.starts(with: self.searchTerm) }
  }
  
  func load() {
    fetchNews()
    fetchStocks()
  }
  
  private func fetchNews() {
    Webservice().fetchTopNews() { news in
      if let news = news {
        self.news = news.map(NewsArticleViewModel.init)
      }
    }
  }
  
  private func fetchStocks() {
    Webservice().fetchStocks() { stocks in
      if let stocks = stocks {
        self.stocks = stocks.map(StockViewModel.init)
      }
    }
  }
}

//
//  Webservice.swift
//  StocksAppSwiftUI
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

class Webservice {
  func fetchStocks(completion: @escaping (([Stock]?) -> Void) ) {
    guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
      fatalError("NO URL VALID")
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else {
        completion(nil)
        return
      }
      
      guard let stocks = try? JSONDecoder().decode([Stock].self, from: data) else {
        completion(nil)
        print("Decoding failed")
        return
      }
      
      completion(stocks)
      
    }.resume()
    
    
  }
}

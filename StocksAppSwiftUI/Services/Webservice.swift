//
//  Webservice.swift
//  StocksAppSwiftUI
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

class Webservice {
  func fetchTopNews(completion: @escaping (([Article]?)) -> Void) {
    guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
      fatalError("NO URL VALID")
    }
    
    URLSession.shared.dataTask(with: url) {data, response, error in
      guard let data = data, error == nil else {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      
      guard let articles = try? JSONDecoder().decode([Article].self, from: data) else {
        DispatchQueue.main.async {
          completion(nil)
        }
        print("Decoding failed")
        return
      }
      
      DispatchQueue.main.async {
        completion(articles)
      }
      
    }.resume()
  }
  
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
      
      DispatchQueue.main.async {
        completion(stocks)
      }
    }.resume()
    
    
  }
}

//
//  NewsArticleViewModel.swift
//  StocksAppSwiftUI
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

struct NewsArticleViewModel {
  let article: Article
  
  var imageURL: String {
    self.article.imageURL
  }
  
  var title: String {
    self.article.title
  }
  
  var publication: String {
    self.article.publication.uppercased()
  }
}

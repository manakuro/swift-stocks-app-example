//
//  NewsArticleView.swift
//  StocksAppSwiftUI
//
//  Copyright © 2020 manato. All rights reserved.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
  let newsArticles: [NewsArticleViewModel]
  let onDragBegin: (DragGesture.Value) -> Void
  let onDragEnd: (DragGesture.Value) -> Void
  
  var screenSize: CGSize {
    UIScreen.main.bounds.size
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        VStack(alignment: .leading) {
          Text("Top News")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding(2)
          
          Text("From Apple News")
            .foregroundColor(Color.gray)
            .font(.body)
            .fontWeight(.bold)
            .padding(2)
        }
        
        Spacer()
      }
      .padding()
      .contentShape(Rectangle())
      .gesture(
        DragGesture()
          .onChanged(self.onDragBegin)
          .onEnded(self.onDragEnd)
      )
      
      ScrollView {
        VStack(spacing: 20) {
          ForEach(self.newsArticles, id: \.title) { article in
            HStack {
              VStack(alignment: .leading, spacing: 4) {
                Text(article.publication)
                  .foregroundColor(Color.gray)
                  .font(.subheadline)
                  .fontWeight(.bold)
                
                Text(article.title)
                  .foregroundColor(Color.white)
                  .font(.headline)
              }
              
              Spacer()
              
              URLImage(URL(string: article.imageURL)!, content: {
                $0.image.resizable()
              }).frame(width: 100, height: 100)
            }
          }
        }.frame(maxWidth: .infinity)
      }
    }
    .frame(width: screenSize.width, height: screenSize.height)
    .background(Color(red: 27/255, green: 28/255, blue: 30/255))
    .cornerRadius(20)
  }
}

struct NewsArticleView_Previews: PreviewProvider {
  static var previews: some View {
    let article = Article(
      title: "The Bull Market is Charging into 2020",
      imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg",
      publication: "The Wallstreet Journal"
    )
    
    return NewsArticleView(
      newsArticles: [NewsArticleViewModel(article: article)],
      onDragBegin: { _ in },
      onDragEnd: { _ in }
    )
  }
}

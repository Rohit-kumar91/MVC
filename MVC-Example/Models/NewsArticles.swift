//
//  Person.swift
//  MVC-Example
//
//  Created by Rohit Prajapati on 04/03/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import Foundation

class Root: Codable {
    let status : String?
    let totalResults: Int?
    let articles : [NewsArticles]?
    
    init(status: String, totalResult: Int, articles: [NewsArticles]) {
        self.status = status
        self.totalResults = totalResult
        self.articles = articles
    }
    
    
}


class NewsArticles: Codable {
    
    let title: String?
    let author: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    let source : Source?
    
    
    init(title: String,
         author: String,
         description: String,
         url: String,
         urlToImage: String,
         publishedAt: String,
         content: String,
         source: Source) {
        
        self.title = title
        self.author = author
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
        self.source = source
    
    }
    
}

class Source: Codable {
    let id: String?
    let name: String?
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

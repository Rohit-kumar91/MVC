//
//  ServiceResponseMapper.swift
//  MVC-Example
//
//  Created by Rohit Prajapati on 04/03/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import Foundation


class ServiceResponseMapper {
    
    func mapData(from ServiceResponse: Data) throws -> Root {
        
        let newArticleDecoder = JSONDecoder()
        let newsArticleResults = try newArticleDecoder.decode(Root.self, from: ServiceResponse)
        
        print("News Articles", newsArticleResults)
        
        return newsArticleResults
    }
    
}

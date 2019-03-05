//
//  WebServiceClient.swift
//  MVC-Example
//
//  Created by Rohit Prajapati on 04/03/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import Foundation


class WebServiceClient {
    
    func fetchDataFromWebService(url: URL, completion: @escaping (Data?, Error?) -> Void) {
       
        let urlSession = URLSession.shared
        
        let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            completion(data, error)
        }
        
        dataTask.resume()
        
    }
    
}

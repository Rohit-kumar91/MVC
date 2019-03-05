//
//  ViewController.swift
//  MVC-Example
//
//  Created by Rohit Prajapati on 04/03/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableData: [NewsArticles] = []
    private let webServiceClient = WebServiceClient()
    private let serviceResponseMapper = ServiceResponseMapper()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(NewsArticleCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        
        guard let serviceURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3c7c3ecc887f4ea19cd3e8b88c1af121") else {
            return
        }
        
        webServiceClient.fetchDataFromWebService(url: serviceURL) { (serviceResponseData, serviceError) in
            DispatchQueue.main.async {
                if let serviceError = serviceError {
                    print("Encounter service error when fetching the data from the server",(serviceError.localizedDescription))
                } else {
                    
                    guard let serviceResponseData = serviceResponseData else { return }
                    print("After guard statement")
                    
                    do {
                        
                        let newsArticles =  try self.serviceResponseMapper.mapData(from: serviceResponseData)

                        self.tableData = newsArticles.articles ?? []
                        self.tableView.reloadData()
                        
                    } catch {
                        print("Caught an exception while fetching the data \(error.localizedDescription)")
                    }
                    
                    
                    
                }
            }
        }
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsArticleCell
        
        let newsArticles = tableData[indexPath.row]
        
        
        cell.textLabel?.text = newsArticles.title
        cell.detailTextLabel?.text = newsArticles.author
        return cell
    }
    
    
}


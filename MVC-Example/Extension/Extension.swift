//
//  Extension.swift
//  MVC-Example
//
//  Created by Rohit Prajapati on 05/03/19.
//  Copyright © 2019 Rohit Prajapati. All rights reserved.
//

import Foundation
import UIKit


//ImageView Extension to load the images from the server.
var imageCache = [String: UIImage]()

extension UIImageView {
    
    func loadImage(with urlString: String) {
        
        //Check the image exist in the cache or not.
        if let cacheImage = imageCache[urlString] {
            self.image = cacheImage
            return
        }
        
        //url for image location.
        guard let url = URL(string: urlString) else { return }
        
        //fetch the content of url.
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //handle error
            if let error = error {
                print("Failed to laod image with error", error.localizedDescription)
            }
            
            //Image Data
            guard let imageData =  data else { return }
            
            //create image using image data.
            let photoImage = UIImage(data: imageData)
            
            //set key value for image cache.
            imageCache[url.absoluteString] = photoImage
            
            //set image
            DispatchQueue.main.async {
                self.image = photoImage
            }
            }.resume()
        
    }
}

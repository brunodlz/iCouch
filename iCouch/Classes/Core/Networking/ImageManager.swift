//
//  ImageManager.swift
//  iCouch
//
//  Created by Bruno da Luz on 16/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit

final class ImageManager {
    
    let cache = NSCache<NSString, UIImage>()
    
    func download(url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
            return
        }
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(nil)
                return
            }
            
            if let data = data, let image = UIImage(data: data)?.resize() {
                self.cache.setObject(image, forKey: url.absoluteString as NSString)
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
}

//
//  UIImage+Extension.swift
//  iCouch
//
//  Created by Bruno da Luz on 16/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit

extension UIImage {
    
    func resize() -> UIImage? {
        let size = CGSize(width: 80.0, height: 120.0)
        let rect = CGRect(x: 0, y: 0, width: 80.0, height: 120.0)
        
        UIGraphicsBeginImageContext(size)
        self.draw(in: rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}

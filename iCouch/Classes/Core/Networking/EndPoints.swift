//
//  EndPoints.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import Foundation

struct Secrets {
    static let url = "https://api.themoviedb.org/3/movie"
    static let keyAPI = ""
}

final class EndPoints {
    
    enum raise {
        case upcomming(Int64)
        case getDetail(Int)
        case image(String)
        
        func url() -> String {
            switch self {
            case .upcomming(let page):
                return "\(Secrets.url)/upcoming?api_key=\(Secrets.keyAPI)&page=\(page)"
            case .getDetail(let idMovie):
                return "\(Secrets.url)\(idMovie)?api_key=\(Secrets.keyAPI)"
            case .image(let name):
                return "https://image.tmdb.org/t/p/w500\(name)"
            }
        }
    }
    
}

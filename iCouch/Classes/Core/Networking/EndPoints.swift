//
//  EndPoints.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import Foundation

struct Secrets {
    static let moviedbURL = "https://api.themoviedb.org/3/movie"
    static let tmdbURL = "https://image.tmdb.org/t/p/w500"
    static let keyAPI = ""
}

final class EndPoints {
    
    enum raise {
        case upcomming(Int64)
        case getDetail(Int)
        case image(String)
        
        func getUrl() -> String {
            switch self {
            case .upcomming(let page):
                return "\(Secrets.moviedbURL)/upcoming?api_key=\(Secrets.keyAPI)&page=\(page)"
            case .getDetail(let idMovie):
                return "\(Secrets.moviedbURL)/\(idMovie)?api_key=\(Secrets.keyAPI)"
            case .image(let name):
                return "\(Secrets.tmdbURL)\(name)"
            }
        }
    }
    
}

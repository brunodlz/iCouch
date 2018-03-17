//
//  MovieDetail.swift
//  iCouch
//
//  Created by Bruno da Luz on 17/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import ObjectMapper

struct MovieDetail {
  
    let poster: String
    let title: String
    let genre: [Genre]
    let releaseDate: String
    let overview: String
  
}

extension MovieDetail: ImmutableMappable {
  
    init(map: Map) throws {
        poster = try map.value("poster_path")
        title = try map.value("title")
        genre = try map.value("genres")
        releaseDate = try map.value("release_date")
        overview = try map.value("overview")
    }
  
}

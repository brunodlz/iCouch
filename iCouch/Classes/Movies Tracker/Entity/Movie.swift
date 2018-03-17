//
//  Movie.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import ObjectMapper

struct Movie {
    
    let adult: Int
    let backdropPath: String
    let originalLanguage: String
    let id: Int
    let originalTitle: String
    let popularity: Double
    let overview: String
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Int
    let voteAverage: Double
    let voteCount: Int
    
}

extension Movie: ImmutableMappable {
    
    init(map: Map) throws {
        adult = try map.value("adult")
        backdropPath = try map.value("backdrop_path")
        originalLanguage = try map.value("original_language")
        id = try map.value("id")
        originalTitle = try map.value("original_title")
        popularity = try map.value("popularity")
        overview = try map.value("overview")
        posterPath = try map.value("poster_path")
        releaseDate = try map.value("release_date")
        title = try map.value("title")
        video = try map.value("video")
        voteAverage = try map.value("vote_average")
        voteCount = try map.value("vote_count")
    }
    
}

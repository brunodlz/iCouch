//
//  Movie.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import ObjectMapper

struct Movie {

    let id: Int
    let title: String
    let originalTitle: String
    let posterPath: String?
    let backdropPath: String?
    let overview: String
    let originalLanguage: String
    let popularity: Double
    let releaseDate: String
    let video: Int
    let voteAverage: Double
    let voteCount: Int
    let adult: Int
    
}

extension Movie: ImmutableMappable {
    
    init(map: Map) throws {
        id = try map.value("id")
        title = try map.value("title")
        originalTitle = try map.value("original_title")
        posterPath = try? map.value("poster_path")
        backdropPath = try? map.value("backdrop_path")
        overview = try map.value("overview")
        originalLanguage = try map.value("original_language")
        popularity = try map.value("popularity")
        releaseDate = try map.value("release_date")
        video = try map.value("video")
        voteAverage = try map.value("vote_average")
        voteCount = try map.value("vote_count")
        adult = try map.value("adult")
    }
    
}

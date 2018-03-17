//
//  MoviesTrackerInteractor.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import RxSwift
import ObjectMapper

final class MoviesTrackerInteractor: MoviesTrackerInteractorInput {
    
    private let api: MoviesTrackerAPI
    
    init(api: MoviesTrackerAPI) {
        self.api = api
    }

    func find(by endPoint: URLRequest) -> Observable<[Movie]> {
        return api.find(endPoint).map { json -> [Movie] in
            guard let movies = json as? [String:AnyObject] else { fatalError("Something is wrong with JSON") }
            
            return (try movies
                .filter { $0.key == "results" }
                .flatMap { return try Mapper<Movie>().mapArray(JSONObject: $0.value) })
        }
    }
}

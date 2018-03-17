//
//  MovieDetailInteractor.swift
//  iCouch
//
//  Created by Bruno da Luz on 17/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import RxSwift
import ObjectMapper

final class MovieDetailInteractor: MovieDetailInteractorInput {
    
    let api: MovieDetailAPI
    
    init(api: MovieDetailAPI) {
        self.api = api
    }
    
    func find(by endPoint: URLRequest) -> Observable<MovieDetail> {
        return api.find(endPoint).map { json -> MovieDetail in
            guard let detail = json as? [String:AnyObject] else { fatalError("Something is wrong with JSON") }
            
            let movie = try Mapper<MovieDetail>().map(JSON: detail)
            
            return movie
        }
    }
    
}

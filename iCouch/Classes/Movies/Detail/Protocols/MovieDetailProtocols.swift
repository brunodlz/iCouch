//
//  MovieDetailProtocols.swift
//  iCouch
//
//  Created by Bruno da Luz on 17/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import RxSwift

protocol MovieDetailView: class {
    
    func show(movie: MovieDetail)
    
    func showError(message: String)
    
}

protocol MovieDetailPresenterInput: class {
    
    init(view: MovieDetailView, interactor: MovieDetailInteractorInput)
    
    func loadContent(from idMovie: Int)
}

protocol MovieDetailAPI: class {

    init(client: TrackerClient)
    
    func find(_ endPoint: URLRequest) -> Observable<Any>
    
}

protocol MovieDetailInteractorInput: class {
    
    init(api: MovieDetailAPI)
    
    func find(by endPoint: URLRequest) -> Observable<MovieDetail>
    
}

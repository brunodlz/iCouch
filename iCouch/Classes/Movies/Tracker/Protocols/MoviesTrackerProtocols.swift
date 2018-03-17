//
//  MoviesTrackerProtocols.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import Foundation
import RxSwift

protocol MoviesTrackerRouter: class {
    
    func showDetail(through movie: Movie)
    
}

protocol MoviesTrackerView: class {
    
    func show(entities: [Movie])
    
    func showError(message: String)
    
}

protocol MoviesTrackerPresenterInput: class {
    
    init(_ view: MoviesTrackerView, interactor: MoviesTrackerInteractorInput, router: MoviesTrackerRouter)
    
    func loadContent(page: Int64)
    
}

protocol MoviesTrackerAPI: class {
    
    init(client: TrackerClient)
    
    func find(_ endPoint: URLRequest) -> Observable<Any>
    
}

protocol MoviesTrackerInteractorInput: class {
    
    init(api: MoviesTrackerAPI)
    
    func find(by endPoint: URLRequest) -> Observable<[Movie]>
    
}

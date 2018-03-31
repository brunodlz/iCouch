//
//  MoviesTrackerModule.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit

final class MoviesTrackerModule: MoviesTrackerRouter {
    
    weak var navigation: UINavigationController?
    
    func start(in window: UIWindow?) {
        
        let moviesView = MoviesTrackerViewController()
        
        let client = TrackerClient()
        let syncAPI = MoviesTrackerSyncAPI(client: client)
        
        let interactor = MoviesTrackerInteractor(api: syncAPI)
        
        let presenter = MoviesTrackerPresenter(moviesView, interactor: interactor, router: self)
        
        moviesView.presenter = presenter

        let mainNavigation = MainNavigationController(rootViewController: moviesView)
        navigation = mainNavigation

        window?.rootViewController = mainNavigation
    }
    
    func showDetail(through movie: Movie) {
        let module = MovieDetailModule(movie)
        module.push(navigator: navigation)
    }
    
}

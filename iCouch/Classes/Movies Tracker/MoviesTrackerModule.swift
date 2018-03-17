//
//  MoviesTrackerModule.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit

final class MoviesTrackerModule: MoviesTrackerRouter {
    
    func start() -> UINavigationController {
        let moviesView = MoviesTrackerViewController()
        
        let client = TrackerClient()
        let syncAPI = MoviesTrackerSyncAPI(client: client)
        
        let interactor = MoviesTrackerInteractor(api: syncAPI)
        
        let presenter = MoviesTrackerPresenter(moviesView, interactor: interactor, router: self)
        
        moviesView.presenter = presenter
        
        return MainNavigationController(rootViewController: moviesView)
    }
    
    func showDetail(through id: Int) {
        print("ID: \(id)")
    }
    
}

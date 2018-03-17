//
//  MovieDetailModule.swift
//  iCouch
//
//  Created by Bruno da Luz on 17/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit

final class MovieDetailModule {

    weak var screenDetail: UIViewController?

    init(_ movie: Movie) {
        let view = MovieDetailViewController(movie)

        let client = TrackerClient()

        let api = MovieDetailSyncAPI(client: client)

        let interactor = MovieDetailInteractor(api: api)

        let presenter = MovieDetailPresenter(view: view, interactor: interactor)

        view.presenter = presenter

        screenDetail = view
    }
    
    func push(navigator: UINavigationController?) {
        navigator?.pushViewController(screenDetail!, animated: true)
    }
    
}

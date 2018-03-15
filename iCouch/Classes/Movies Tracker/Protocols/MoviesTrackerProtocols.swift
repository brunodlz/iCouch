//
//  MoviesTrackerProtocols.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import Foundation

protocol MoviesTrackerRouter: class {
    
    func showDetail(through id: Int)
    
}

protocol MoviesTrackerView: class {
    
    func show(entities: [Any])
    
    func showError(message: String)
    
}

protocol MoviesTrackerPresenter: class {
    
    func loadContent()
    
}

protocol MoviesTrackerInteractor: class {
    
    func find() -> [Any] // TODO: Add observable (Rx)
    
}

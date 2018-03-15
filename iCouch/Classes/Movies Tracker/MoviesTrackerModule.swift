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
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        let navigationController = UINavigationController(rootViewController: moviesView)
        navigationController.navigationBar.barTintColor = ColorPalette.darkGray
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: ColorPalette.white]
        
        return navigationController
    }
    
    func showDetail(through id: Int) {
        print("ID: \(id)")
    }
    
}

//
//  MainNavigationController.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit

final class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = ColorPalette.darkGray
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: ColorPalette.white]
    }

}

//
//  UIViewController+Extension.swift
//  iCouch
//
//  Created by Bruno da Luz on 17/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit

extension UIViewController {

    func didStartRequest() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    func didFinishRequest() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}

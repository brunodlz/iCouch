//
//  MoviesTrackerViewController.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit

class MoviesTrackerViewController: UIViewController {

    private let moviesTrackerScreen: MoviesTrackerScreen
    
    private var collectionView: UICollectionView {
        return moviesTrackerScreen.collectionView
    }
    
    static let reuseIdentifier = "reuseIdentifier"
    
    var presenter: MoviesTrackerPresenter?
    
    required init() {
        moviesTrackerScreen = MoviesTrackerScreen(frame: .zero)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializers()
        
        view.addSubview(collectionView)
        view.addConstraintsForAllEdges(of: collectionView)
    }
    
    private func initializers() {
        title = "Movies Tracker"
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension MoviesTrackerViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesTrackerViewController.reuseIdentifier, for: indexPath) as? MoviesCell else {
            fatalError("Do you have any problems with the cell?")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }

}

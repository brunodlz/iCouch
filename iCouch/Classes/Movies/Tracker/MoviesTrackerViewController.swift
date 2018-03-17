//
//  MoviesTrackerViewController.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit

class MoviesTrackerViewController: UIViewController, MoviesTrackerView {

    private let moviesTrackerScreen: MoviesTrackerScreen
    
    private var collectionView: UICollectionView {
        return moviesTrackerScreen.collectionView
    }
    
    private var listOfMovies: [Movie] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private var currentPage: Int64 = 1
    
    static let reuseIdentifier = "reuseIdentifier"
    
    var presenter: MoviesTrackerPresenter?
    
    required init() {
        moviesTrackerScreen = MoviesTrackerScreen(frame: .zero)
        listOfMovies = [Movie]()
        
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
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be loaded!")
        }

        didStartRequest()
        presenter.loadContent(page: currentPage)
    }
    
    private func initializers() {
        title = "Movies Tracker"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func show(entities: [Movie]) {
        didFinishRequest()
        listOfMovies.append(contentsOf: entities)
    }
    
    func showError(message: String) {
        print("👻 \(message)")
    }
}

extension MoviesTrackerViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesTrackerViewController.reuseIdentifier, for: indexPath) as? MoviesCell else {
            fatalError("Do you have any problems with the cell?")
        }
        let movie = listOfMovies[indexPath.item]
        cell.set(path: movie.posterPath)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == listOfMovies.count - 1 {
            currentPage += 1
            presenter?.loadContent(page: currentPage)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = listOfMovies[indexPath.item]
        presenter?.showDetail(through: movie)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfMovies.count
    }

}

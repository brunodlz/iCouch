//
//  MovieDetailViewController.swift
//  iCouch
//
//  Created by Bruno da Luz on 16/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController, MovieDetailView {

    private let movie: Movie
    private let screen: MovieDetailScreen
    
    var presenter: MovieDetailPresenterInput?
    
    init(_ movie: Movie) {
        screen = MovieDetailScreen(frame: .zero)
        self.movie = movie

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = movie.title

        view.backgroundColor = ColorPalette.darkGray
        screen.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(screen)
        view.addConstraintsForAllEdges(of: screen)

        guard let presenter = presenter else {
            fatalError("The view was loaded without the presenter!")
        }

        didStartRequest()
        presenter.loadContent(from: movie.id)
    }
    
    func show(movie: MovieDetail) {
        didFinishRequest()
        screen.configure(movie)
    }
    
    func showError(message: String) {
        print("👻 \(message)")
    }
}

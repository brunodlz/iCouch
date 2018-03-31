//
//  MoviesTrackerPresenter.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import RxSwift

final class MoviesTrackerPresenter: MoviesTrackerPresenterInput {
    
    private let view: MoviesTrackerView
    private let interactor: MoviesTrackerInteractorInput
    private let router: MoviesTrackerRouter
    
    private let disposeBag = DisposeBag()
    
    init(_ view: MoviesTrackerView, interactor: MoviesTrackerInteractorInput, router: MoviesTrackerRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loadContent(page: Int) {
        guard let endPoint = URL(string: EndPoints.raise.upcomming(page).getUrl()) else {
            fatalError("The endPoint cannot be nil")
        }
        
        self.interactor.find(by: URLRequest(url: endPoint))
            .subscribe { [weak self] event in
                switch event {
                case .next(let elements):
                    self?.view.show(entities: elements.0, totalPages: elements.1)
                case .error(let error):
                    self?.view.showError(message: error.localizedDescription)
                default: break
                }
            }.disposed(by: disposeBag)
    }
    
    func showDetail(through movie: Movie) {
        router.showDetail(through: movie)
    }
}

//
//  MovieDetailPresenter.swift
//  iCouch
//
//  Created by Bruno da Luz on 17/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import RxSwift

final class MovieDetailPresenter: MovieDetailPresenterInput {

    private let view: MovieDetailView
    private let interactor: MovieDetailInteractorInput
    
    private let disposeBag = DisposeBag()
    
    init(view: MovieDetailView, interactor: MovieDetailInteractorInput) {
        self.view = view
        self.interactor = interactor
    }

    func loadContent(from idMovie: Int) {
        guard let endPoint = URL(string: EndPoints.raise.getDetail(idMovie).getUrl()) else { fatalError("") }
        
        interactor.find(by: URLRequest(url: endPoint))
            .subscribe { [weak self] event in
                switch event {
                case .next(let element):
                    self?.view.show(movie: element)
                case .error(let error):
                    print(error)
                default: break
                }
            }.disposed(by: disposeBag)
    }
    
}

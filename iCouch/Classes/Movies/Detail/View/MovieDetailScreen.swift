//
//  MovieDetailScreen.swift
//  iCouch
//
//  Created by Bruno da Luz on 17/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit
import AlamofireImage

final class MovieDetailScreen: UIView {

    let scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.isScrollEnabled = true
        scroll.backgroundColor = ColorPalette.darkGray
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    let poster: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let genre: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.textColor = ColorPalette.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let releaseDate: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = ColorPalette.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let overview: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addHierarchy()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addHierarchy() {
        scrollView.addSubview(poster)
        scrollView.addSubview(genre)
        scrollView.addSubview(releaseDate)
        scrollView.addSubview(overview)

        addSubview(scrollView)
    }
    
    private func addConstraints() {

        addConstraintsForAllEdges(of: scrollView)

        poster.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        poster.centerXAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.centerXAnchor).isActive = true
        poster.heightAnchor.constraint(equalTo: poster.widthAnchor, multiplier: 1.2).isActive = true

        genre.topAnchor.constraint(equalTo: poster.bottomAnchor, constant: 8).isActive = true
        genre.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor).isActive = true
        genre.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor).isActive = true
        
        releaseDate.topAnchor.constraint(equalTo: genre.bottomAnchor, constant: 2).isActive = true
        releaseDate.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor).isActive = true
        releaseDate.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor).isActive = true
        
        overview.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 8).isActive = true
        overview.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor).isActive = true
        overview.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor).isActive = true
        overview.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8).isActive = true
    }

    func configure(_ movie: MovieDetail) {
        self.releaseDate.text = movie.releaseDate
        self.overview.text = movie.overview

        self.genre.text = movie.genre.flatMap { String($0.name) }.joined(separator: "∙")

        self.poster.image = nil

        if let path = movie.poster, let url = URL(string: EndPoints.raise.image(path).getUrl()) {
            self.poster.af_setImage(withURL: url)
        } else {
            self.poster.image = UIImage(named: "image_not_found")
        }
    }
}

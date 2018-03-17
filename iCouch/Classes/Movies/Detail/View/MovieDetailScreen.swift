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
    
    let poster: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let genre: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 13)
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
        addSubview(poster)
        addSubview(genre)
        addSubview(releaseDate)
        addSubview(overview)
    }
    
    private func addConstraints() {
        poster.topAnchor.constraint(equalTo: topAnchor).isActive = true
        poster.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        poster.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        poster.heightAnchor.constraint(equalTo: poster.widthAnchor, multiplier: 1.0/2.0).isActive = true
        
        genre.topAnchor.constraint(equalTo: poster.bottomAnchor, constant: 8).isActive = true
        genre.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        genre.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        
        releaseDate.topAnchor.constraint(equalTo: genre.bottomAnchor, constant: 2).isActive = true
        releaseDate.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        releaseDate.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        
        overview.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 8).isActive = true
        overview.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        overview.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
    }

    func configure(_ movie: MovieDetail) {
        self.releaseDate.text = movie.releaseDate
        self.overview.text = movie.overview

        self.genre.text = movie.genre.compactMap { String($0.name) }.joined(separator: "∙")

        guard let url = URL(string: EndPoints.raise.image(movie.poster).getUrl()) else {
            fatalError("EndPoint Image cannot be created!")
        }

        self.poster.image = nil
        self.poster.af_setImage(withURL: url)
    }
}

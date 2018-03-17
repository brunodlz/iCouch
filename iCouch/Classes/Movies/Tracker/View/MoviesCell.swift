//
//  MoviesCell.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit

class MoviesCell: UICollectionViewCell {
    
    let banner: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 4
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(banner)
        contentView.addConstraintsForAllEdges(of: banner)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(path: String) {
        guard let url = URL(string: EndPoints.raise.image(path).getUrl()) else {
            fatalError("EndPoint Image cannot be created!")
        }

        banner.image = nil
        banner.af_setImage(withURL: url)
    }
}

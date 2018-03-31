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
        image.contentMode = .scaleAspectFit
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
    
    func set(path: String?) {
        banner.image = nil

        if let path = path, let url = URL(string: EndPoints.raise.image(path).getUrl()) {
            banner.af_setImage(withURL: url)
        } else {
            banner.image = UIImage(named: "image_not_found")
        }
    }
}

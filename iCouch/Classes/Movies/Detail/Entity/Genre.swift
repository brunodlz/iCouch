//
//  Genre.swift
//  iCouch
//
//  Created by Bruno da Luz on 17/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import ObjectMapper

struct Genre {

    let name: String

}

extension Genre: ImmutableMappable {

    init(map: Map) throws {
        name = try map.value("name")
    }

}

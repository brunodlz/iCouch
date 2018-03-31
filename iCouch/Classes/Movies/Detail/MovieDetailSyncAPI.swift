//
//  MovieDetailSyncAPI.swift
//  iCouch
//
//  Created by Bruno da Luz on 17/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import RxSwift

final class MovieDetailSyncAPI: MovieDetailAPI {
    
    let client: TrackerClient
    
    init(client: TrackerClient) {
        self.client = client
    }
    
    func find(_ endPoint: URLRequest) -> Observable<Any> {
        return client.request(by: endPoint)
    }
    
}

//
//  MoviesTrackerSyncAPI.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import RxSwift

final class MoviesTrackerSyncAPI: MoviesTrackerAPI {
    
    let client: TrackerClient
    
    init(client: TrackerClient) {
        self.client = client
    }
    
    func find(_ endPoint: URLRequest) -> Observable<Any> {
        return client.request(by: endPoint)
    }
    
}

//
//  TrackerClient.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import RxSwift
import Alamofire

final class TrackerClient {
    
    func request(by endPoint: URLRequest) -> Observable<Any> {
        return Observable.create { observer in
            Alamofire.request(endPoint).responseJSON { response in
                switch response.result {
                case .success(let data):
                    observer.onNext(data)
                    observer.onCompleted()
                    break
                case .failure(let error):
                    observer.onError(error)
                    break
                }
            }
            return Disposables.create()
        }
    }
    
}

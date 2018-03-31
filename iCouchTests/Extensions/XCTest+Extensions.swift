//
//  XCTest+Extensions.swift
//  iCouchTests
//
//  Created by Bruno da Luz on 17/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import XCTest
import Mockingjay

extension XCTest {

    public func stub(urlString: String, jsonFileName: String) -> Mockingjay.Stub {
        let path = Bundle(for: type(of: self)).path(forResource: jsonFileName, ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        return stub(uri(urlString), jsonData(data))
    }

}

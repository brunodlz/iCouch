//
//  UpComingMoviesSpec.swift
//  iCouchTests
//
//  Created by Bruno da Luz on 17/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import Quick
import Nimble
import Mockingjay
import RxSwift
import RxTest
import RxBlocking

@testable import iCouch

class UpComingMoviesSpec: QuickSpec {

    override func spec() {
        describe("getUpcomingMovies") {
            let client = TrackerClient()
            let api = MoviesTrackerSyncAPI(client: client)
            let interactor = MoviesTrackerInteractor(api: api)

            let urlString = EndPoints.raise.upcomming(1).getUrl()

            guard let url = URL(string: urlString) else {
                fail("URL is null")
                return
            }

            context("success") {
                var response: [Movie]?

                _ = self.stub(urlString: urlString, jsonFileName: "GetUpcomingMovies")

                let blocking = interactor.find(by: URLRequest(url: url)).toBlocking()
                expect(blocking).toEventuallyNot(beNil())

                expect { try blocking.single() }.toNot(throwError())

                do {
                    response = try blocking.single()
                } catch {
                    fail("Response not contains value!")
                }

                expect(response).toEventuallyNot(beNil())
                expect(response).toEventuallyNot(beEmpty())

                it("should return the first movie") {
                    guard let firstMovie = response?[0] else {
                        fail("Array not should be empty")
                        return
                    }

                    expect(firstMovie.id) == 353486
                    expect(firstMovie.title) == "Jumanji: Welcome to the Jungle"
                    expect(firstMovie.posterPath) == "/bXrZ5iHBEjH7WMidbUDQ0U2xbmr.jpg"
                }

                it("should return the second movie") {
                    guard let firstMovie = response?[1] else {
                        fail("Array not should be empty")
                        return
                    }

                    expect(firstMovie.id) == 401981
                    expect(firstMovie.title) == "Red Sparrow"
                    expect(firstMovie.posterPath) == "/vLCogyfQGxVLDC1gqUdNAIkc29L.jpg"
                }
            }
        }
    }

}

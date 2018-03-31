//
//  MovieDetailSpec.swift
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

class MovieDetailSpec: QuickSpec {
    
    override func spec() {
        describe("getMovieDetail") {
            let client = TrackerClient()
            let api = MovieDetailSyncAPI(client: client)
            let interactor = MovieDetailInteractor(api: api)

            let idMovie = 353486
            let urlString = EndPoints.raise.getDetail(idMovie).getUrl()

            guard let url = URL(string: urlString) else {
                fail("URL is null")
                return
            }

            context("success") {
                var response: MovieDetail?

                _ = self.stub(urlString: urlString, jsonFileName: "GetMovieDetail")

                let blocking = interactor.find(by: URLRequest(url: url)).toBlocking()
                expect(blocking).toEventuallyNot(beNil())

                expect { try blocking.single() }.toNot(throwError())

                do {
                    response = try blocking.single()
                } catch {
                    fail("Response not contains value")
                }

                expect(response).toEventuallyNot(beNil())

                it("should return movie detail") {
                    guard let movie = response else {
                        fail("Response not should be nil")
                        return
                    }

                    expect(movie.title) == "Jumanji: Welcome to the Jungle"
                    expect(movie.genre[0].name) == "Action"
                    expect(movie.genre[1].name) == "Adventure"
                    expect(movie.genre[2].name) == "Comedy"
                    expect(movie.genre[3].name) == "Family"
                    expect(movie.releaseDate) == "2017-12-09"
                    expect(movie.overview) == "The tables are turned as four teenagers are sucked into Jumanji's world - pitted against rhinos, black mambas and an endless variety of jungle traps and puzzles. To survive, they'll play as characters from the game."

                }
            }
        }
    }
}

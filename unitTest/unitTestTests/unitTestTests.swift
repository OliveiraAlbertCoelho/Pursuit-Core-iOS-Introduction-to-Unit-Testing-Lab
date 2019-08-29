//
//  unitTestTests.swift
//  unitTestTests
//
//  Created by albert coelho oliveira on 8/29/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import XCTest
@testable import unitTest

class unitTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadJoke() {
        let data = getJokesDataFromJSON()
        let joke = JokeWrapper.getJokes(fron: data)
        XCTAssertTrue(joke.self != nil, "There was no Object")
    }
    private func getJokesDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "joke", ofType: "json")else {
            fatalError("Could not find JSON")
        }
        let url = URL(fileURLWithPath: pathToData)
        do{
            let data = try Data(contentsOf: url)
            return data
        }
        catch let JsonError {
            fatalError("oops")
        }
    }
    func testjokeArrayCount() {
        let data = getJokesDataFromJSON()
        let joke = JokeWrapper.getJokes(fron: data)
        XCTAssertTrue(joke.count == 10, "There aren't 10 items, it has \(joke.count)")
    }
    func testThatString (){
        let data = getJokesDataFromJSON()
        let joke = JokeWrapper.getJokes(fron: data)
        for i in 0..<joke.count{
            XCTAssertTrue(joke[i].punchline == joke[i].punchline.description, " \(joke[i].punchline) is not a String")
            XCTAssertTrue(joke[i].setup == joke[i].setup.description, "\(joke[i].setup) is not a String")
            XCTAssertTrue(joke[i].type == joke[i].type.description, " \(joke[i].type) is not a String")
        }
    }
    
}

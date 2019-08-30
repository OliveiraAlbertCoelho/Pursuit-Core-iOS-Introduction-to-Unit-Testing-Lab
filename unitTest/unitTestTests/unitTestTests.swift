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
    //function to get data
    private func getDataFromJSon(name: String) -> Data {
        guard let pathToData = Bundle.main.path(forResource: name, ofType: "json")else {
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
    func testLoadJoke() {
        let data = getDataFromJSon(name: "joke")
        let joke = JokeWrapper.getJokes(fron: data)
        XCTAssertTrue(joke.self != nil, "There was no Object")
    }
    func testjokeArrayCount() {
         let data = getDataFromJSon(name: "joke")
          let joke = JokeWrapper.getJokes(fron: data)
        XCTAssertTrue(joke.count == 10, "There aren't 10 items, it has \(joke.count)")
    }
    func testThatString (){
        let data = getDataFromJSon(name: "joke")
        let joke = JokeWrapper.getJokes(fron: data)
        for i in 0..<joke.count{
            XCTAssertTrue(joke[i].punchline == joke[i].punchline.description, " \(joke[i].punchline) is not a String")
            XCTAssertTrue(joke[i].setup == joke[i].setup.description, "\(joke[i].setup) is not a String")
            XCTAssertTrue(joke[i].type == joke[i].type.description, " \(joke[i].type) is not a String")
        }
    }
    func testLoadStarWars() {
        let data = getDataFromJSon(name: "starWars")
        let star = starWrapper.getStarWars(fron: data)
        XCTAssertTrue(star.self != nil, "There was no Object")
    }
    func testStarArrayCount() {
        let data = getDataFromJSon(name: "starWars")
        let star = starWrapper.getStarWars(fron: data)
        XCTAssertTrue(star.results.count == 7, "There aren't 10 items, it has \(star.results.count)")
    }
    func testThatStringStarWars (){
        let data = getDataFromJSon(name: "starWars")
        let star = starWrapper.getStarWars(fron: data)
        for i in 0..<star.results.count{
            XCTAssertTrue(star.results[i].opening_crawl == star.results[i].opening_crawl.description, " \(star.results[i].opening_crawl) is not a String")
            XCTAssertTrue(star.results[i].release_date == star.results[i].release_date.description, " \(star.results[i].release_date) is not a String")
             XCTAssertTrue(star.results[i].title == star.results[i].title.description, " \(star.results[i].title) is not a String")
        }
    }
    
    func testLoadTrivia() {
        let data = getDataFromJSon(name: "trivia")
        let trivia = triviaWrapper.getTrivia(fron: data)
        XCTAssertTrue(trivia.self != nil, "There was no Object")
    }
    func testTriviaArrayCount() {
        let data = getDataFromJSon(name: "trivia")
             let trivia = triviaWrapper.getTrivia(fron: data)
        XCTAssertTrue(trivia.count == 10, "There aren't 10 items, it has \(trivia.count)")
    }
    func testThatStringTrivia(){
        let data = getDataFromJSon(name: "trivia")
         let trivia = triviaWrapper.getTrivia(fron: data)
        for i in 0..<trivia.count{
            XCTAssertTrue(trivia[i].category == trivia[i].category.description, " \(trivia[i].category) is not a String")
           XCTAssertTrue(trivia[i].correct_answer == trivia[i].correct_answer.description, " \(trivia[i].correct_answer) is not a String")
             XCTAssertTrue(trivia[i].type == trivia[i].type.description, " \(trivia[i].type) is not a String")
        }
    }
}

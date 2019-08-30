//
//  triviaModel.swift
//  unitTest
//
//  Created by albert coelho oliveira on 8/29/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation

struct triviaWrapper: Codable{
    let results: [trivia]
    static func getTrivia(fron data: Data) -> triviaWrapper{
        do {
            let newTrivia = try
        JSONDecoder().decode(triviaWrapper.self, from: data)
            return newTrivia
        } catch let decodeError {
            fatalError("could not decode info\(decodeError)")
        }
    }
}

struct trivia: Codable {
    let question: String
    let category: String
    let type: String
    let correct_answer: String
    let incorrect_answers: [String]
}

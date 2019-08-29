//
//  jokeModel.swift
//  unitTest
//
//  Created by albert coelho oliveira on 8/29/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation

struct JokeWrapper: Codable{
    let type: String
    let setup: String
    let punchline: String
    static func getJokes(fron data: Data) -> [JokeWrapper]{
        do {
            let newJoke = try
                JSONDecoder().decode([JokeWrapper].self, from: data)
            return newJoke
        } catch let decodeError {
            fatalError("could not decode info\(decodeError)")
        }
    }
   
}

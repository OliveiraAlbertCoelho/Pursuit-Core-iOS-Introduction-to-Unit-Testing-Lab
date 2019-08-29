//
//  starWarsModel.swift
//  unitTest
//
//  Created by albert coelho oliveira on 8/29/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation

struct starWrapper: Codable{
    let results: [Movie]
    static func getStarWars(fron data: Data) -> starWrapper{
        do {
            let newWars = try
                JSONDecoder().decode(starWrapper.self, from: data)
            return newWars
        } catch let decodeError {
            fatalError("could not decode info\(decodeError)")
        }
    }
}
struct Movie: Codable{
    let title: String
    let episode_id: Int
    let opening_crawl: String
    let release_date: String
}

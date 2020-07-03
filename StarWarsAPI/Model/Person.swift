//
//  Person.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 25/06/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import Foundation

struct Person: Codable {
    
    let name: String
    let height: String
    let mass: String
    let hair: String
    let birthYear: String
    let gender: String
    let homeworldUrl: String
    let filmUrls: [String]
    let vehicleUrls: [String]
    let starshipUrls: [String]
    
    // To prevent the wrong property name, in codable they must match with the json property
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender
        case homeworldUrl = "homeworld"
        case filmUrls = "films"
        case vehicleUrls = "vehicles"
        case starshipUrls = "starships"
    }
    
}

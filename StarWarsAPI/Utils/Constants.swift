//
//  Constants.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 19/06/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import UIKit

let blackBG = UIColor.black.withAlphaComponent(0.6).cgColor
let purpleish = UIColor(named: "purpleish")

let baseURL = "https://swapi.dev/api/"

let personURL = baseURL + "people/"

typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeworldResponseCompletion = (Homeworld?) -> ()
typealias VehiclesResponseCompletion = (Vehicles?) -> Void
typealias StarshipsResponseCompletion = (Starships?) -> ()
typealias FilmsResponseCompletion = (Films?) -> Void

enum Segue: String {
    case homeworld = "ToHomeWorld"
    case vehicles = "ToVehicles"
    case starships = "ToStarships"
    case films = "ToFilms"
}

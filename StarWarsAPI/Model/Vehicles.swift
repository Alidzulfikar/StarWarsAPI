//
//  Vehicles.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 03/07/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import Foundation

struct Vehicles: Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: String
    let length: String
    let max_atmosphering_speed: String
    let crew: String
    let passengers: String
}

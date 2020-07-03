//
//  Films.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 03/07/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import Foundation

struct Films: Codable {
    let title: String
    let episode_id: Int
    let director: String
    let producer: String
    let release_date: String
    let opening_crawl: String

}

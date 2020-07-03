//
//  FilmsApi.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 03/07/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import Foundation
import Alamofire

class FilmsApi {
    
    func getFilms(url: String, completion: @escaping FilmsResponseCompletion) {
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let films = try jsonDecoder.decode(Films.self, from: data)
                completion(films)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}

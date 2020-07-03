//
//  StarshipsApi.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 03/07/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import Foundation
import Alamofire

class StarshipsApi {
    
    func getStarships(url: String, completion: @escaping StarshipsResponseCompletion) {
        guard let url = URL(string: url) else { return }
        
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let starships = try jsonDecoder.decode(Starships.self, from: data)
                completion(starships)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}

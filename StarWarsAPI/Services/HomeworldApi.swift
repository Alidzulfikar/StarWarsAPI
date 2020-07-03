//
//  HomeworldApi.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 02/07/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import UIKit
import Alamofire

class HomeworldApi {
    
    func getHomeworld(url:String, completion: @escaping HomeworldResponseCompletion) {
        guard let url = URL(string: url) else { return }
        
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let homeworld = try jsonDecoder.decode(Homeworld.self, from: data)
                completion(homeworld)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
}

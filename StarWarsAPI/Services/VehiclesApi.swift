//
//  VehiclesApi.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 03/07/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import Foundation
import Alamofire

class VehiclesApi {
    
    func getVehicles(url: String, completion: @escaping VehiclesResponseCompletion) {
        guard let url = URL(string: url) else { return }
        
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let vehicles = try jsonDecoder.decode(Vehicles.self, from: data)
                completion(vehicles)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}

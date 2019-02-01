//
//  StarshipApi.swift
//  StarTrivia
//
//  Created by Luca Lo Forte on 01/02/2019.
//  Copyright © 2019 Luca Lo Forte. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class StarshipApi {
    static let instance = StarshipApi()
    
    func getStarship(url: String, completion: @escaping StarshipResponseCompletion) {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else {return completion(nil)}
            do {
                let json = try JSON(data: data)
                let starship = self.parseStarship(json: json)
                DispatchQueue.main.async {
                    completion(starship)
                }
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    private func parseStarship(json: JSON) -> Starship {
        let name = json["name"].stringValue
        let model = json["model"].stringValue
        let manufacturer = json["manufacturer"].stringValue
        let cost = json["cost_in_credits"].stringValue
        let length = json["length"].stringValue
        let speed = json["max_atmosphering_speed"].stringValue
        let crew = json["crew"].stringValue
        let passengers = json["passengers"].stringValue
        let capacity = json["cargo_capacity"].stringValue
        
        return Starship(name: name, model: model, manufacturer: manufacturer, cost: cost, length: length, speed: speed, crew: crew, passengers: passengers, capacity: capacity)
    }
}

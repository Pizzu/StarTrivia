//
//  HomeworldApi.swift
//  StarTrivia
//
//  Created by Luca Lo Forte on 01/02/2019.
//  Copyright © 2019 Luca Lo Forte. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HomeworldApi {
    
    static let instance = HomeworldApi()
    
    func getHomeworld(url: String, completion: @escaping HomewordResponseCompletion) {
        
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
                let homeworld = self.parseHomeworld(json: json)
                DispatchQueue.main.async {
                    completion(homeworld)
                }
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    private func parseHomeworld(json: JSON) -> Homeworld {
        let name = json["name"].stringValue
        let climate = json["climate"].stringValue
        let terrain = json["terrain"].stringValue
        let population = json["population"].stringValue
        
        return Homeworld(name: name, climate: climate, terrain: terrain, population: population)
    }
    
}

//
//  VehicleApi.swift
//  StarTrivia
//
//  Created by Luca Lo Forte on 01/02/2019.
//  Copyright © 2019 Luca Lo Forte. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class VehicleApi {
    
    static let instance = VehicleApi()
    
    func getVehicle(url: String, completion: @escaping VehicleResponseCompletion) {
        
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
                let vehicle = self.parseHomeworld(json: json)
                DispatchQueue.main.async {
                    completion(vehicle)
                }
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    private func parseHomeworld(json: JSON) -> Vehicle {
        let name = json["name"].stringValue
        let model = json["model"].stringValue
        let manufacturer = json["manufacturer"].stringValue
        let cost = json["cost_in_credits"].stringValue
        let length = json["length"].stringValue
        let speed = json["max_atmosphering_speed"].stringValue
        let crew = json["crew"].stringValue
        let passengers = json["passengers"].stringValue
        
        return Vehicle(name: name, model: model, manufacturer: manufacturer , cost: cost, length: length, speed: speed, crew: crew, passengers: passengers)
    }
    
}

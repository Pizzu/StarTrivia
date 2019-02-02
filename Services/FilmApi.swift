//
//  FilmApi.swift
//  StarTrivia
//
//  Created by Luca Lo Forte on 02/02/2019.
//  Copyright © 2019 Luca Lo Forte. All rights reserved.
//

import Foundation

import Foundation
import Alamofire
import SwiftyJSON

class FilmApi {
    static let instance = FilmApi()
    
    func getFilm(url: String, completion: @escaping FilmResponseCompletion) {
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
                let film = self.parseFilm(json: json)
                DispatchQueue.main.async {
                    completion(film)
                }
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    private func parseFilm(json: JSON) -> Film {
        let title = json["title"].stringValue
        let episode = json["episode_id"].intValue
        let director = json["director"].stringValue
        let producer = json["producer"].stringValue
        let releaseDate = json["release_date"].stringValue
        let crawl = json["opening_crawl"].stringValue
        
        return Film(title: title, episode: episode, director: director, producer: producer, releaseDate: releaseDate, crawl: crawl)
    }
}

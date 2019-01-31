//
//  PersonApi.swift
//  StarTrivia
//
//  Created by Luca Lo Forte on 31/01/2019.
//  Copyright © 2019 Luca Lo Forte. All rights reserved.
//

import Foundation

class PersonApi {
    
    static let instance = PersonApi()
    
    func getRandomPerson(id: Int, completion: @escaping PersonResponseCompletion ) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        
    }
    
}

//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Luca Lo Forte on 01/02/2019.
//  Copyright © 2019 Luca Lo Forte. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var terrainLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    var person : Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeworldApi.instance.getHomeworld(url: person.homeworldUrl) { (homeworld) in
            if let homeworld = homeworld {
                self.setupView(homeworld: homeworld)
            }
        }
    }
    
    func setupView(homeworld: Homeworld) {
        nameLabel.text = homeworld.name
        climateLabel.text = homeworld.climate
        terrainLabel.text = homeworld.terrain
        populationLabel.text = homeworld.population
    }

}

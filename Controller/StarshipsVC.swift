//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Luca Lo Forte on 01/02/2019.
//  Copyright © 2019 Luca Lo Forte. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    @IBOutlet weak var passengersLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var person : Person!
    var starships = [String]()
    var currentStarship = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = starships.count > 1
        guard let firstStarship = starships.first else { return }
        getStarship(url: firstStarship)
    }
    
    func getStarship(url: String) {
        StarshipApi.instance.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.setupView(starship: starship)
            }
        }
    }
    
    func setupView(starship: Starship) {
        nameLabel.text = starship.name
        modelLabel.text = starship.model
        manufacturerLabel.text = starship.manufacturer
        costLabel.text = starship.cost
        lengthLabel.text = starship.length
        speedLabel.text = starship.speed
        crewLabel.text = starship.crew
        passengersLabel.text = starship.passengers
        capacityLabel.text = starship.capacity
    }
    
    @IBAction func previousPressed(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        currentStarship += 1
        setButtonState()
    }
    
    func setButtonState() {
        previousBtn.isEnabled = currentStarship == 0 ? false : true
        nextBtn.isEnabled = currentStarship == starships.count - 1 ? false : true
        
        getStarship(url: starships[currentStarship])
    }
    

}

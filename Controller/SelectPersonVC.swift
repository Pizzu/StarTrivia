//
//  ViewController.swift
//  StarTrivia
//
//  Created by Luca Lo Forte on 31/01/2019.
//  Copyright © 2019 Luca Lo Forte. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func randomBtnPressed(_ sender: Any) {
        let random = Int.random(in: 1 ... 87)
        PersonApi.instance.getRandomPerson(id: random) { (person) in
            if let person = person {
                self.setupView(person: person)
                self.person = person
            }
        }
    }
    
    func setupView(person: Person) {
        nameLabel.text = person.name
        heightLabel.text = person.height
        massLabel.text = person.mass
        hairLabel.text = person.hair
        birthLabel.text = person.birthYear
        genderLabel.text = person.gender
        
        homeworldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesBtn.isEnabled = person.vehicleUrls.count > 0 ? true : false
        starshipsBtn.isEnabled = person.starshipUrls.count > 0 ? true : false
        filmsBtn.isEnabled = person.filmUrls.count > 0 ? true : false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHomeworld" {
            if let homewordVC = segue.destination as? HomeworldVC {
                homewordVC.person = person
            }
        } else if segue.identifier == "toVehicles" {
            if let vehiclesVC = segue.destination as? VehiclesVC {
                vehiclesVC.person = person
            }
        } else if segue.identifier == "toStarships" {
            if let starshipsVC = segue.destination as? StarshipsVC {
                starshipsVC.person = person
            }
        } else if segue.identifier == "toFilms" {
            if let filmsVC = segue.destination as? FilmsVC {
                filmsVC.person = person
            }
        }
    }
}



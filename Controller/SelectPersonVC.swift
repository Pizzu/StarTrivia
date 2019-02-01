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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func randomBtnPressed(_ sender: Any) {
        let random = Int.random(in: 1 ... 87)
        PersonApi.instance.getRandomPerson(id: random) { (person) in
            if let person = person {
                self.nameLabel.text = person.name
                self.heightLabel.text = person.height
                self.massLabel.text = person.mass
                self.hairLabel.text = person.hair
                self.birthLabel.text = person.birthYear
                self.genderLabel.text = person.gender
                
                self.homeworldBtn.isEnabled = !person.homeworldUrl.isEmpty
                self.vehiclesBtn.isEnabled = person.vehicleUrls.count > 0 ? true : false
                self.starshipsBtn.isEnabled = person.starshipUrls.count > 0 ? true : false
                self.filmsBtn.isEnabled = person.filmUrls.count > 0 ? true : false
            }
        }
    }
    
    @IBAction func homeworldPressed(_ sender: Any) {
    }
    
    @IBAction func vehiclesPressed(_ sender: Any) {
    }
    
    @IBAction func starshipsPressed(_ sender: Any) {
    }
    
    @IBAction func filmsPressed(_ sender: Any) {
    }
    
    
}


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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
                
            }
        }
    }
    
}


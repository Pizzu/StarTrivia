//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Luca Lo Forte on 01/02/2019.
//  Copyright © 2019 Luca Lo Forte. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    @IBOutlet weak var passengersLabel: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person : Person!
    var vehicles = [String]()
    var currentVehicle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = vehicles.count > 1
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
    }
    
    func getVehicle(url: String) {
        VehicleApi.instance.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setupView(vehicle: vehicle)
            }
        }
    }
    
    func setupView(vehicle: Vehicle) {
        nameLabel.text = vehicle.name
        modelLabel.text = vehicle.model
        manufacturerLabel.text = vehicle.manufacturer
        costLabel.text = vehicle.cost
        lengthLabel.text = vehicle.length
        speedLabel.text = vehicle.speed
        crewLabel.text = vehicle.crew
        passengersLabel.text = vehicle.passengers
    }
    
    @IBAction func previousBtnPressed(_ sender: Any) {
        currentVehicle -= 1
        setButtonState()
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }
    
    func setButtonState() {
        previousBtn.isEnabled = currentVehicle == 0 ? false : true
        nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
    
        getVehicle(url: vehicles[currentVehicle])
    }
    
}

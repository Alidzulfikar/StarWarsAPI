//
//  VehiclesVC.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 02/07/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
    var person: Person!
    let vehiclesApi = VehiclesApi()
    var vehicles = [String]()
    var currentVehicle: Int = 0
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufacturerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    
    @IBOutlet weak var previousBtn: FadeEnableBtn!
    @IBOutlet weak var nextBtn: FadeEnableBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vehicles = person.vehicleUrls
        guard let firstVehicle = vehicles.first else { return }
        getVehicles(url: firstVehicle)
        setUpButtonState()
    }
    
    func getVehicles(url: String) {
        vehiclesApi.getVehicles(url: url) { (vehicles) in
            if let vehicles = vehicles {
                self.setupUI(vehicles: vehicles)
            }
        }
    }
    
    func setupUI(vehicles: Vehicles) {
        nameLbl.text = vehicles.name
        modelLbl.text = vehicles.model
        manufacturerLbl.text = vehicles.manufacturer
        costLbl.text = vehicles.cost_in_credits
        lengthLbl.text = vehicles.length
        speedLbl.text = vehicles.max_atmosphering_speed
        crewLbl.text = vehicles.crew
        passengersLbl.text = vehicles.passengers
    }
    

    @IBAction func previousBtnPressed(_ sender: Any) {
        currentVehicle -= 1
        setUpButtonState()
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        currentVehicle += 1
        setUpButtonState()
    }
    
    func setUpButtonState() {
        previousBtn.isEnabled = currentVehicle == 0 ? false : true
        
        nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        
        getVehicles(url: vehicles[currentVehicle])
    }
    
}

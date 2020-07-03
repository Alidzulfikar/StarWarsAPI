//
//  StarshipsVC.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 02/07/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    var person: Person!
    let starshipsApi = StarshipsApi()
    var starships = [String]()
    var currentStarships = 0
    
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
        
        starships = person.starshipUrls
        guard let firstStarship = starships.first else { return }
        getStarships(url: firstStarship)
        setupButtonState()
    }
    
    func getStarships(url: String) {
        starshipsApi.getStarships(url: url) { (starships) in
            if let starships = starships {
                self.setupUI(starships: starships)
            }
        }
    }
    
    private func setupUI(starships: Starships) {
        nameLbl.text = starships.name
        modelLbl.text = starships.model
        manufacturerLbl.text = starships.manufacturer
        costLbl.text = starships.cost_in_credits
        lengthLbl.text = starships.length
        speedLbl.text = starships.max_atmosphering_speed
        crewLbl.text = starships.crew
        passengersLbl.text = starships.passengers
    }
    

    @IBAction func previousBtnPressed(_ sender: FadeEnableBtn) {
        currentStarships -= 1
        setupButtonState()
    }
    
    @IBAction func nextBtnPressed(_ sender: FadeEnableBtn) {
        currentStarships += 1
        setupButtonState()
    }
    
    private func setupButtonState() {
        previousBtn.isEnabled = currentStarships == 0 ? false : true
        nextBtn.isEnabled = currentStarships == starships.count - 1 ? false : true
        getStarships(url: starships[currentStarships])
    }
    
    

}

//
//  ViewController.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 19/06/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    let personAPI = PersonApi()
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func randomButtonPressed(_ sender: UIButton) {
        let random = Int.random(in: 1 ... 87)
        spinner.startAnimating()
        personAPI.getRandomPersonAlamoCodable(id: random) { (person) in
            self.spinner.stopAnimating()
            if let person = person {
                self.setupView(person: person)
                self.person = person
            }
        }
    }
    
    func setupView(person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        homeworldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If wewant to pass the same data to several VC it's better to use protocol
        if var destinationVC = segue.destination as? PersonProtocol {
            destinationVC.person = person
        }
        
        // This is a boiler code and bad habit for programmer
//        if segue.identifier == Segue.homeworld.rawValue {
//            if let homeworldVC = segue.destination as? HomeworldVC {
//                homeworldVC.person = person
//            }
//        } else if segue.identifier == Segue.vehicles.rawValue {
//            if let vehiclesVC = segue.destination as? VehiclesVC {
//                vehiclesVC.person = person
//            }
//        } else if segue.identifier == Segue.starships.rawValue {
//            if let starshipsVC = segue.destination as? StarshipsVC {
//                starshipsVC.person = person
//            }
//        } else if segue.identifier == Segue.films.rawValue {
//            if let filmsVC = segue.destination as? FilmsVC {
//                filmsVC.person = person
//            }
//        }
    }
}

protocol PersonProtocol {
    var person: Person! {get set}
}

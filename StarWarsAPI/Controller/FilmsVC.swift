//
//  FilmsVC.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 02/07/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    var person: Person!
    let filmsApi = FilmsApi()
    var films = [String]()
    var currentFilm = 0
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var contentTV: UITextView!
    @IBOutlet weak var previousBtn: FadeEnableBtn!
    @IBOutlet weak var nextBtn: FadeEnableBtn!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        films = person.filmUrls
        guard let firstFilm = films.first else { return }
        getFilms(url: firstFilm)
        setupButtonState()
        
    }
    
    private func getFilms(url: String) {
        filmsApi.getFilms(url: url) { (films) in
            if let film = films {
                self.setupUI(films: film)
            }
        }
    }
    
    private func setupUI(films: Films) {
        titleLbl.text = films.title
        episodeLbl.text = String(films.episode_id)
        directorLbl.text = films.director
        producerLbl.text = films.producer
        releasedLbl.text = films.release_date
        contentTV.text = films.opening_crawl
    }
    
    @IBAction func previousBtnPressed(_ sender: FadeEnableBtn) {
        currentFilm -= 1
        setupButtonState()
    }
    
    @IBAction func nextBtnPressed(_ sender: FadeEnableBtn) {
        currentFilm += 1
        setupButtonState()
    }
    
    private func setupButtonState() {
        previousBtn.isEnabled = currentFilm == 0 ? false : true
        nextBtn.isEnabled = currentFilm == films.count - 1 ? false : true
        getFilms(url: films[currentFilm])
    }
}

//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Luca Lo Forte on 01/02/2019.
//  Copyright © 2019 Luca Lo Forte. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var crawlTextView: UITextView!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person : Person!
    var films = [String]()
    var currentFilm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.filmUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        guard let firstFilm = films.first else { return }
        getFilm(url: firstFilm)
    }
    
    func getFilm(url: String) {
        FilmApi.instance.getFilm(url: url) { (film) in
            if let film = film {
                self.setupView(film: film)
            }
        }
    }
    
    func setupView(film: Film) {
        titleLabel.text = film.title
        episodeLabel.text = String(film.episode)
        directorLabel.text = film.director
        producerLabel.text = film.producer
        releasedLabel.text = film.releaseDate
        let stripped = film.crawl.replacingOccurrences(of: "\n", with: " ")
        crawlTextView.text = stripped.replacingOccurrences(of: "\r", with: "")
    }
    
    @IBAction func previousPressed(_ sender: Any) {
        currentFilm -= 1
        setButtonState()
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        currentFilm += 1
        setButtonState()
    }
    
    func setButtonState() {
        previousBtn.isEnabled = currentFilm == 0 ? false : true
        nextBtn.isEnabled = currentFilm == films.count - 1 ? false : true
        
        getFilm(url: films[currentFilm])
    }
    
}

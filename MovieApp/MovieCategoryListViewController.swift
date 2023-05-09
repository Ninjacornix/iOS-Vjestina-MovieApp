//
//  MovieCategoryListViewController.swift
//  MovieApp
//
//  Created by Milan Vrankić on 09.04.2023..
// zadaca2

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MovieCategoryListViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    var popular: MovieListWithName!
    var free: MovieListWithName!
    var trending: MovieListWithName!
    
    var popularData: [MovieModel]!
    var freeData: [MovieModel]!
    var trendingData: [MovieModel]!
    
    var stackView: UIStackView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        obtainData()
        buildView()
        setContraints()
    }
    
    init(coord: Coordinator){
        self.coordinator = coord
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func buildView(){
        view.backgroundColor = .white
        title = "Movie List"
        popular = MovieListWithName(data: popularData, name: "What's popular", coord: coordinator!)
        free = MovieListWithName(data: freeData, name: "Free to Watch", coord: coordinator!)
        trending = MovieListWithName(data: trendingData, name: "Trending", coord: coordinator!)
        
        stackView = UIStackView(arrangedSubviews: [popular, free, trending])
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        
        view.addSubview(stackView)
    }
    
    func obtainData(){
        popularData = MovieUseCase().popularMovies
        freeData = MovieUseCase().freeToWatchMovies
        trendingData = MovieUseCase().trendingMovies
    }
    
    func setContraints(){
        stackView.autoPinEdgesToSuperviewSafeArea()
    }
    
}

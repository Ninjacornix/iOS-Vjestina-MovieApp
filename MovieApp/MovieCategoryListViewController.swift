//
//  MovieCategoryListViewController.swift
//  MovieApp
//
//  Created by Milan Vrankić on 09.04.2023..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MovieCategoryListViewController: UIViewController {
    
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
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func buildView(){
        view.backgroundColor = .white
        
        popular = MovieListWithName(data: popularData, name: "What's popular")
        free = MovieListWithName(data: freeData, name: "Free to Watch")
        trending = MovieListWithName(data: trendingData, name: "Trending")
        
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

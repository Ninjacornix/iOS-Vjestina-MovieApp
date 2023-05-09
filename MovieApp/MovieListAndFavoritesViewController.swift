//
//  MovieListAndFavoritesViewController.swift
//  MovieApp
//
//  Created by Milan Vrankić on 29.04.2023..
//

import Foundation
import UIKit
import PureLayout

class MovieListAndFavoritesViewController: UIViewController, Coordinating, UITabBarControllerDelegate {
    var coordinator: Coordinator?
    var tabView: UITabBarController!
    var favorites: FavoritesViewController!
    var movieList: MovieCategoryListViewController!
    var movieListNavController: UINavigationController!
    var childs: [UIViewController & Coordinating]!
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        buildViews()
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    func buildViews(){
        tabView = UITabBarController()
        favorites = FavoritesViewController()
        movieList = MovieCategoryListViewController(coord: coordinator!)
        movieListNavController = UINavigationController(rootViewController: movieList)
        
        movieList.title = "Movie List"
        favorites.title = "Favorites"
        
        tabView.modalPresentationStyle = .fullScreen
        tabView.setViewControllers([movieListNavController, favorites], animated: true)
        
        let data = ["house", "heart"]
        
        guard let items = tabView.tabBar.items else {
            return
        }
        
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: data[i])
        }
        
        present(tabView, animated: true)
        
    }
}

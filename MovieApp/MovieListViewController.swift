//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Milan Vrankić on 08.04.2023..
// zadaca2

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MovieListViewController: UIViewController {
    
    var movies: [MovieModel]!
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(MovieItemWithCover.self,
                       forCellReuseIdentifier: MovieItemWithCover.indentifier)
        return table
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        getMovies()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func getMovies(){
        movies = MovieUseCase().allMovies
    }
    
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieItemWithCover.indentifier, for: indexPath) as? MovieItemWithCover else { return UITableViewCell()}
        
        cell.configure(movieTitle: movies[indexPath.row].name, movieDesc: movies[indexPath.row].summary, movieCover: movies[indexPath.row].imageUrl)
        cell.frame.size.width = 50
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 154
    }
}

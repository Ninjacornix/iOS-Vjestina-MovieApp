//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Milan Vrankić on 28.03.2023..
//

import Foundation
import PureLayout
import MovieAppData

class MovieDetailsViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    var collectionView: UICollectionView!
    var movieDetailsCover: MovieDetailsWithCoverView!
    var movieDetailsOverview: MovieDetailsOverview!
    var movieData: MovieDetailsModel!
    var crew: [MovieCrewMemberModel]!
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder is not defined!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        setConstraints()
        setAnimations()
    }
    
    func buildView(){
        title = "Movie Details"
        view.backgroundColor = .white
        
        movieData = MovieUseCase().getDetails(id: 111161)
        crew = movieData.crewMembers
        
        movieDetailsCover = MovieDetailsWithCoverView()
        view.addSubview(movieDetailsCover)
        
        movieDetailsOverview = MovieDetailsOverview(synopsis: movieData.summary)
        view.addSubview(movieDetailsOverview)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.bounds.width / 3) - 20, height: 50)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieDetailsCell.self, forCellWithReuseIdentifier: "MovieDetailsCell")
        view.addSubview(collectionView)
    }
    
    func setConstraints(){
        movieDetailsCover.autoPinEdge(toSuperviewEdge: .top)
        movieDetailsCover.autoPinEdge(toSuperviewEdge: .leading)
        movieDetailsCover.autoPinEdge(toSuperviewEdge: .trailing)
        movieDetailsCover.autoSetDimension(.height, toSize: 420)
        
        movieDetailsOverview.autoPinEdge(toSuperviewEdge: .leading)
        movieDetailsOverview.autoPinEdge(.top, to: .bottom, of: movieDetailsCover)
        movieDetailsOverview.autoPinEdge(toSuperviewEdge: .trailing)
        movieDetailsOverview.autoSetDimension(.height, toSize: 150)
        
        collectionView.autoPinEdge(.top, to: .bottom, of: movieDetailsOverview)
        collectionView.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        collectionView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        collectionView.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    func setAnimations(){
        movieDetailsOverview.frame = CGRect(x: -200, y: 0, width: view.bounds.width, height: view.bounds.height)
        collectionView.alpha = 0
        
        UIView.animate(withDuration: 0.2){
            self.movieDetailsOverview.frame.origin.x += 200
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.2, options: [], animations: {
            self.collectionView.alpha = 1
        })
    }
}

extension MovieDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.crewMembers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDetailsCell", for: indexPath) as! MovieDetailsCell
        cell.configure(name: crew[indexPath.item].name, role: crew[indexPath.item].role)
        return cell
    }
}

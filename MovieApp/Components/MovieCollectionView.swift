//
//  MovieCollectionView.swift
//  MovieApp
//
//  Created by Milan Vrankić on 10.04.2023..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MovieCollectionView: UIViewController {
    let coord: Coordinator
    let movies: [MovieModel]
    var collectionView: UICollectionView!
    
    init(data: [MovieModel], coord: Coordinator) {
        self.movies = data
        self.coord = coord
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.register(MovieCoverWithStar.self, forCellWithReuseIdentifier: MovieCoverWithStar.indentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame.origin = CGPoint(x: 16, y: 30)
        collectionView.frame.size.width = UIScreen.main.bounds.width
        collectionView.frame.size.height = 180
    }
}

extension MovieCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCoverWithStar.indentifier, for: indexPath) as? MovieCoverWithStar else { return UICollectionViewCell()}
        cell.configure(cover: movies[indexPath.row].imageUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 122, height: 179)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coord.eventOccured(with: .clickedOnMovie)
    }
    
}

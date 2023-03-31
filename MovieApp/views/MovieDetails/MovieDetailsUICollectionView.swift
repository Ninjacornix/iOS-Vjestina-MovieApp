//
//  MovieDetailsUICollectionViewController.swift
//  MovieApp
//
//  Created by Milan Vrankić on 29.03.2023..
//

import Foundation
import PureLayout
import MovieAppData

class MovieDetailsUICollectionView: UICollectionView {
    
    var data: [MovieCrewMemberModel]!
    
    init(data: [MovieCrewMemberModel]) {
        super.init(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        self.data = data
        self.register(MovieDetailsCell.self, forCellWithReuseIdentifier: "MovieDetailsCell")
        self.backgroundColor = .clear
        self.isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

//
//  MovieListWithName.swift
//  MovieApp
//
//  Created by Milan Vrankić on 09.04.2023..
// zadaca2

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MovieListWithName: UIView {
    var coord: Coordinator!
    
    var categoryName: UILabel!
    var list: MovieCollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(data: [MovieModel], name: String = "", coord: Coordinator) {
        super.init(frame: CGRect())
        self.coord = coord
        buildView(data: data, name: name)
        setContraints()
    }
    
    func buildView(data: [MovieModel], name: String = ""){
        categoryName = UILabel()
        list = MovieCollectionView(data: data, coord: coord)
        
        categoryName.text = name
        categoryName.font = .boldSystemFont(ofSize: 20)
        
        addSubview(categoryName)
        addSubview(list.view)
    }
    
    func setContraints(){
        categoryName.autoPinEdge(toSuperviewEdge: .top)
        categoryName.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
    }
    
}

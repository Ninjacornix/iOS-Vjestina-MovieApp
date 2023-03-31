//
//  MovieDetailsCell.swift
//  MovieApp
//
//  Created by Milan Vrankić on 29.03.2023..
//

import Foundation
import UIKit

class MovieDetailsCell: UICollectionViewCell {
    
    let nameLabel = UILabel()
    let roleLabel = UILabel()
    
    init(name: String = "", role: String = "") {
        super.init(frame: CGRect())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 13)
        roleLabel.font = UIFont.systemFont(ofSize: 12)
        addSubview(nameLabel)
        addSubview(roleLabel)
        
        nameLabel.autoPinEdge(toSuperviewEdge: .leading)
        nameLabel.autoPinEdge(toSuperviewEdge: .top)
        
        roleLabel.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 5)
        roleLabel.autoPinEdge(toSuperviewEdge: .leading)
    }
    
    func configure(name: String, role: String){
        nameLabel.text = name
        roleLabel.text = role
    }
    
}

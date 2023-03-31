//
//  MovieDetailsOverview.swift
//  MovieApp
//
//  Created by Milan Vrankić on 29.03.2023..
//

import Foundation
import PureLayout

class MovieDetailsOverview: UIView {
    
    var synopsis: String!
    var overView: UILabel!
    var about: UILabel!
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(synopsis: String = "") {
        super.init(frame: CGRect())
        self.synopsis = synopsis
        buildViews()
    }
    
    func buildViews(){
        overView = UILabel()
        overView.text = "Overview"
        overView.font = UIFont.boldSystemFont(ofSize: 20)
        overView.textColor = .blue
        
        about = UILabel()
        about.text = synopsis
        about.lineBreakMode = .byWordWrapping
        about.numberOfLines = 0
        
        addSubview(overView)
        addSubview(about)
        
        overView.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        overView.autoPinEdge(toSuperviewEdge: .leading, withInset: 15)
        
        about.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        about.autoPinEdge(.top, to: .bottom, of: overView, withOffset: 10)
        about.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
    }
}

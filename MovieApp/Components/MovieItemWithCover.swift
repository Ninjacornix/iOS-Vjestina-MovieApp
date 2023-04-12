//
//  MovieItemWithCover.swift
//  MovieApp
//
//  Created by Milan Vrankić on 08.04.2023..
//

import Foundation
import UIKit

class MovieItemWithCover: UITableViewCell {
    static let indentifier = "MovieItemWithCover"
    
    var title: UILabel!
    var desc: UILabel!
    var cover: UIImageView!
    var container: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView(movieTitle: "", movieDesc: "", movieCover: "")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        container.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        container.autoPinEdge(toSuperviewEdge: .top)
        container.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        container.autoSetDimension(.height, toSize: 142)
        
        cover.autoPinEdge(toSuperviewEdge: .leading)
        cover.autoPinEdge(toSuperviewEdge: .top)
        cover.autoSetDimension(.width, toSize: 97)
        cover.autoSetDimension(.height, toSize: 142)
        
        title.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
        title.autoPinEdge(.leading, to: .trailing, of: cover, withOffset: 16)
        title.autoPinEdge(toSuperviewEdge: .trailing, withInset: 32)
        
        desc.autoPinEdge(.leading, to: .trailing, of: cover, withOffset: 16)
        desc.autoPinEdge(.top, to: .bottom, of: title, withOffset: 8)
        desc.autoPinEdge(toSuperviewEdge: .trailing)
        
        container.layer.shadowOpacity = 0.25
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowRadius = 5
        container.layer.shadowOffset = CGSize(width: -5, height: 5)
        container.layer.shadowPath = UIBezierPath(rect: container.bounds).cgPath
    }
    
    func buildView(movieTitle: String = "", movieDesc: String = "", movieCover: String = ""){
        title = UILabel()
        desc = UILabel()
        cover = UIImageView()
        container = UIView()
        
        container.layer.cornerRadius = 10
        container.layer.borderWidth = 0.1
        container.backgroundColor = .white
        
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 15)
        title.lineBreakMode = .byWordWrapping
        title.text = movieTitle
        title.numberOfLines = 2
        
        desc.textColor = .gray
        desc.text = movieDesc
        desc.lineBreakMode = .byWordWrapping
        desc.font = UIFont.systemFont(ofSize: 12)
        desc.numberOfLines = 20
        
        cover.contentMode = .scaleAspectFill
        cover.layer.cornerRadius = 10
        cover.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMinXMinYCorner
        ]
        cover.clipsToBounds = true
        
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(container)
        container.addSubview(title)
        container.addSubview(desc)
        container.addSubview(cover)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()){
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.cover.image = UIImage(data: data)
            }
        }
    }
    
    func configure(movieTitle: String = "", movieDesc: String = "", movieCover: String = ""){
        downloadImage(from: URL(string: movieCover)!)
        desc.text = movieDesc
        title.text = movieTitle
    }
}

//
//  MovieCoverWithStar.swift
//  MovieApp
//
//  Created by Milan Vrankić on 09.04.2023..
//

import Foundation
import UIKit
import PureLayout

class MovieCoverWithStar: UICollectionViewCell {
    static let indentifier = "MovieCoverWithStar"
    
    var image: UIImageView!
    var star: UIButton!
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }
    
    func buildView(){
        image = UIImageView()
        star = UIButton()
        
        let img = UIImage(systemName: "heart")
        star.setImage(img, for: .normal)
        star.backgroundColor = .gray
        star.layer.cornerRadius = 15
        star.layer.opacity = 0.7
        
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
        addSubview(image)
        addSubview(star)
    }
    
    func setConstraints(){
        image.autoPinEdgesToSuperviewEdges()
        
        star.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        star.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        star.autoSetDimension(.width, toSize: 30)
        star.autoSetDimension(.height, toSize: 30)
        
        image.autoSetDimensions(to: CGSize(width: 122, height: 179))
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()){
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image.image = UIImage(data: data)
            }
        }
    }
    
    public func configure(cover: String = ""){
        downloadImage(from: URL(string: cover)!)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
    }
    
}

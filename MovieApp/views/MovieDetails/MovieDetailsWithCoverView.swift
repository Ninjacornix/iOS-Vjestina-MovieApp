//
//  MovieDetailsWithCoverView.swift
//  MovieApp
//
//  Created by Milan Vrankić on 28.03.2023..
//

import Foundation
import PureLayout
import MovieAppData

class MovieDetailsWithCoverView: UIView {
    
    var coverImage: UIImageView!
    var rating: UILabel!
    var userScore: UILabel!
    var movieTitle: UILabel!
    var star: UIButton!
    var length: UILabel!
    var genere: UILabel!
    var year: UILabel!
    var date: UILabel!
    var category: MovieCategoryModel!
    var movieDetails: MovieDetailsModel!
    
    required init?(coder: NSCoder) {
        fatalError("coder is not defined!")
    }
    
    init() {
        super.init(frame: CGRect())
        movieDetails = MovieUseCase().getDetails(id: 111161)
        buildView()
        setConstraints()
        setAnimations()
    }
    
    func buildView(){
        coverImage = UIImageView()
        downloadImage(from: URL(string: movieDetails.imageUrl)!)
        coverImage.contentMode = .scaleAspectFill
        
        movieTitle = UILabel()
        movieTitle.text = movieDetails.name
        movieTitle.textColor = .white
        movieTitle.font = UIFont.boldSystemFont(ofSize: 20)
        
        year = UILabel()
        year.text = "(" + String(movieDetails.year) + ")"
        year.textColor = .white
        year.font = UIFont.boldSystemFont(ofSize: 20)
        
        star = UIButton()
        let img = UIImage(systemName: "star")
        star.setImage(img, for: .normal)
        star.backgroundColor = .gray
        star.layer.cornerRadius = 20
        
        userScore = UILabel()
        userScore.text = "User Score"
        userScore.font = UIFont.boldSystemFont(ofSize: 20)
        userScore.textColor = .white
        
        rating = UILabel()
        rating.text = String(movieDetails.rating)
        rating.font = UIFont.boldSystemFont(ofSize: 30)
        rating.textColor = .white
        
        length = UILabel()
        let dur = toHoursAndMins(movieDetails.duration)
        length.text = String(dur.hours) + "h " + String(dur.leftMinutes) + "m"
        length.font = UIFont.boldSystemFont(ofSize: 20)
        length.textColor = .white
        
        let dirs = String(describing: movieDetails.categories[0])
        genere = UILabel()
        genere.text = dirs.capitalized
        genere.font = UIFont.boldSystemFont(ofSize: 20)
        genere.textColor = .white
        
        date = UILabel()
        date.textColor = .white
        let ogdf = DateFormatter()
        ogdf.dateFormat = "yyyy-mm-dd"
        guard let formatingDate = ogdf.date(from: movieDetails.releaseDate) else {return}
        
        let nwdf = DateFormatter()
        nwdf.dateFormat = "dd/mm/yyyy"
        date.text = nwdf.string(from: formatingDate)
        
        addSubview(coverImage)
        addSubview(movieTitle)
        addSubview(year)
        addSubview(date)
        addSubview(star)
        addSubview(userScore)
        addSubview(rating)
        addSubview(length)
        addSubview(genere)
    }
    
    func setConstraints(){
        coverImage.autoPinEdge(toSuperviewEdge: .top)
        coverImage.autoPinEdge(toSuperviewEdge: .leading)
        coverImage.autoPinEdge(toSuperviewEdge: .trailing)
        coverImage.autoSetDimension(.height, toSize: 250)
        
        movieTitle.autoPinEdge(toSuperviewEdge: .left, withInset: 5)
        movieTitle.autoPinEdge(toSuperviewEdge: .top, withInset: 250)
        
        year.autoPinEdge(.leading, to: .trailing, of: movieTitle, withOffset: 5)
        year.autoPinEdge(toSuperviewEdge: .top, withInset: 250)
        
        date.autoPinEdge(.top, to: .bottom, of: movieTitle, withOffset: 20)
        date.autoPinEdge(toSuperviewEdge: .left, withInset: 5)
        
        star.autoPinEdge(toSuperviewEdge: .leading, withInset: 5)
        star.autoPinEdge(.top, to: .bottom, of: length, withOffset: 10)
        star.autoSetDimension(.width, toSize: 40)
        star.autoSetDimension(.height, toSize: 40)
        
        rating.autoPinEdge(.bottom, to: .top, of: movieTitle, withOffset: -20)
        rating.autoPinEdge(toSuperviewEdge: .leading, withInset: 5)
        
        userScore.autoPinEdge(.leading, to: .trailing, of: rating, withOffset: 15)
        userScore.autoPinEdge(.bottom, to: .top, of: movieTitle, withOffset: -25)
        
        genere.autoPinEdge(toSuperviewEdge: .leading, withInset: 5)
        genere.autoPinEdge(.top, to: .bottom, of: date, withOffset: 10)
        
        length.autoPinEdge(.leading, to: .trailing, of: genere, withOffset: 15)
        length.autoPinEdge(.top, to: .bottom, of: date, withOffset: 10)
    }
    
    func setAnimations(){
        movieTitle.frame = CGRect(x: -200, y: 0, width: bounds.width, height: bounds.height)
        year.frame = CGRect(x: -200, y: 0, width: bounds.width, height: bounds.height)
        userScore.frame = CGRect(x: -200, y: 0, width: bounds.width, height: bounds.height)
        genere.frame = CGRect(x: -200, y: 0, width: bounds.width, height: bounds.height)
        length.frame = CGRect(x: -200, y: 0, width: bounds.width, height: bounds.height)
        rating.frame = CGRect(x: -200, y: 0, width: bounds.width, height: bounds.height)
        date.frame = CGRect(x: -200, y: 0, width: bounds.width, height: bounds.height)
        
        UIView.animate(withDuration: 0.2){
            self.movieTitle.frame.origin.x += 200
            self.year.frame.origin.x += 200
            self.userScore.frame.origin.x += 200
            self.genere.frame.origin.x += 200
            self.length.frame.origin.x += 200
            self.rating.frame.origin.x += 200
            self.date.frame.origin.x += 200
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()){
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.coverImage.image = UIImage(data: data)
            }
        }
    }
    
    func toHoursAndMins(_ minutes: Int) -> (hours: Int , leftMinutes: Int){
        return (minutes / 60, (minutes % 60))
    }
}

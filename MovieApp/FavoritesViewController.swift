//
//  FavoritesViewController.swift
//  MovieApp
//
//  Created by Milan Vrankić on 29.04.2023..
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Favorites"
    }
}

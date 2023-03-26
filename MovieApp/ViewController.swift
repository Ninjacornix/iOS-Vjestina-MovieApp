//
//  ViewController.swift
//  MovieApp
//
//  Created by Milan Vrankić on 25.03.2023..
//

import UIKit
import MovieAppData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let details = MovieUseCase().getDetails(id: 111161)
        print(details)
    }


}


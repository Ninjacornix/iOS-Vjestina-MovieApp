//
//  MainCoordinator.swift
//  MovieApp
//
//  Created by Milan Vrankić on 29.04.2023..
//

import Foundation
import UIKit

class Router: Coordinator {
    var children: [Coordinator]?
    
    var navigationController: UINavigationController?
    
    func eventOccured(with type: Event) {
        switch type {
        case .clickedOnMovie:
            var vc: UIViewController & Coordinating = MovieDetailsViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    func start() {
        let tabbarvc = UITabBarController()
        var vc: UIViewController & Coordinating = MovieListAndFavoritesViewController()
        tabbarvc.viewControllers = [vc]
        vc.coordinator = self
        navigationController?.setViewControllers([tabbarvc], animated: false)
    }
    
}

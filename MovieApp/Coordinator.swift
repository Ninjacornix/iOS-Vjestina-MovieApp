//
//  Coordinator.swift
//  MovieApp
//
//  Created by Milan Vrankić on 29.04.2023..
//

import Foundation
import UIKit

enum Event{
    case clickedOnMovie
}

protocol Coordinator {
    var navigationController: UINavigationController? {get set}
    var children: [Coordinator]? {get set}
    func eventOccured(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? {get set}
}

//
//  SignInLabel.swift
//  MovieApp
//
//  Created by Milan Vrankić on 28.03.2023..
//

import Foundation
import UIKit

class SignInLabel: UILabel {
    
    init() {
        super.init(frame: CGRect())
    }
    
    convenience init(text: String = "") {
        self.init()
        self.text = text
        self.textAlignment = .left
        self.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

//
//  SingInFields.swift
//  MovieApp
//
//  Created by Milan Vrankić on 28.03.2023..
//

import Foundation
import UIKit

class SignInFields: UITextField {
    
    init() {
        super.init(frame: CGRect())
    }
    
    convenience init(placeHolder: String = ""){
        self.init()
        placeholder = placeHolder
        backgroundColor = UIColor(red: 0.07, green: 0.23, blue: 0.39, alpha: 1.00)
        layer.cornerRadius = 5.0
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.systemFont(ofSize: 14),
        ]
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: frame.height))
        leftView = padding
        leftViewMode = .always
        attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: attributes)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

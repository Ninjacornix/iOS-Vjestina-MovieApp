//
//  LoginView.swift
//  MovieApp
//
//  Created by Milan Vrankić on 26.03.2023..
//

import Foundation
import UIKit
import PureLayout

class LoginView: UIView {
    
    var singInLabel: UILabel!
    var mailAdressLabel: UILabel!
    var passwordLabel: UILabel!
    var singInButton: UIButton!
    var mailTextField: UITextField!
    var passwordField: UITextField!
    
    init(){
        super.init(frame: CGRect())
        
        buildView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildView(){
        backgroundColor = .blue
        singInLabel = UILabel();
        singInLabel.text = "Sign in"
        addSubview(singInLabel)
    }
}

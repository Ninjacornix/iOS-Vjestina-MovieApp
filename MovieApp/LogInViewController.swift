//
//  LogInViewController.swift
//  MovieApp
//
//  Created by Milan Vrankić on 26.03.2023..
//

import Foundation
import UIKit
import PureLayout

class LoginViewController: UIViewController {
    
    var singInLabel: UILabel!
    var mailAdressLabel: SignInLabel!
    var passwordLabel: SignInLabel!
    var singInButton: UIButton!
    var mailTextField: SignInFields!
    var passwordField: SignInFields!
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder is not defined!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        setViews()
    }
    
    func buildView(){
        view.backgroundColor = UIColor(red: 0.04, green: 0.15, blue: 0.25, alpha: 1.00)
        
        singInLabel = UILabel()
        singInLabel.text = "Sign In"
        singInLabel.textAlignment = .center
        singInLabel.textColor = .white
        singInLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        mailAdressLabel = SignInLabel(text: "Email address")
        
        mailTextField = SignInFields(placeHolder: "ex. Matt@iosCourse.com")
        
        passwordLabel = SignInLabel(text: "Password")
        
        passwordField = SignInFields(placeHolder: "Enter your password")

        singInButton = UIButton()
        singInButton.setTitle("Sign in", for: .normal)
        singInButton.layer.cornerRadius = 5.0
        singInButton.backgroundColor = UIColor(red: 0.30, green: 0.70, blue: 0.87, alpha: 1.00)
        singInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
    }
    
    func setViews(){
        view.addSubview(singInLabel)
        view.addSubview(mailAdressLabel)
        view.addSubview(passwordLabel)
        view.addSubview(passwordField)
        view.addSubview(singInButton)
        view.addSubview(mailTextField)
        
        singInLabel.autoPinEdge(toSuperviewSafeArea: .left)
        singInLabel.autoPinEdge(toSuperviewSafeArea: .right)
        singInLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 40)
        
        mailAdressLabel.autoPinEdge(.top, to: .bottom, of: singInLabel, withOffset: 50)
        mailAdressLabel.autoPinEdge(toSuperviewSafeArea: .left, withInset: 10)
        
        mailTextField.autoPinEdge(.top, to: .bottom, of: mailAdressLabel, withOffset: 10)
        mailTextField.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 10)
        mailTextField.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 10)
        mailTextField.autoSetDimension(.height, toSize: 40)
        
        passwordLabel.autoPinEdge(.top, to: .bottom, of: mailTextField, withOffset: 10)
        passwordLabel.autoPinEdge(toSuperviewSafeArea: .left, withInset: 10)
        
        passwordField.autoPinEdge(.top, to: .bottom, of: passwordLabel, withOffset: 10)
        passwordField.autoPinEdge(toSuperviewSafeArea: .left, withInset: 10)
        passwordField.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 10)
        passwordField.autoSetDimension(.height, toSize: 40)
        
        singInButton.autoPinEdge(.top, to: .bottom, of: passwordField, withOffset: 40)
        singInButton.autoPinEdge(toSuperviewSafeArea: .left, withInset: 40)
        singInButton.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 40)
    }
}

//
//  ViewController.swift
//  Task2
//
//  Created by Dynamo Software on 9.04.20.
//  Copyright © 2020 Dynamo Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var signinBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateState();

        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    @IBAction func registerClicked(_ sender: Any) {
        guard let username = textField.text ,let password = passField.text, username != "", password != "" else
        {
            label.text = "Please, fill in both fields."
            return
        }
        var a = UserDefaults.standard.string(forKey: username)
        guard UserDefaults.standard.string(forKey: username) == nil
        else
        {
            label.text = "Username is already taken."
            return
        }
        
        UserDefaults.standard.set(password, forKey: username)
        UserDefaults.standard.set(username, forKey: "currentUser")
        updateState()
    }
    
    @IBAction func logOutClicked(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "currentUser")
        updateState()
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        guard let username = textField.text ,let password = passField.text, username != "", password != "" else
        {
            label.text = "Please, fill in both fields."
            return
        }
        
        guard let currentUserPassword = UserDefaults.standard.string(forKey: username) else
        {
            label.text = "User '\(username)' does not exist."
            return
        }
        
        if currentUserPassword == password {
            UserDefaults.standard.set(username, forKey: "currentUser")
        } else {
            label.text = "Wrong password"
        }
    }
    
    func updateState(){
        var isLoggedIn = false;
        if let currentUser = UserDefaults.standard.string(forKey: "currentUser"){
            isLoggedIn = true
            label.text = "Logged in as \(currentUser)"
        }
        else
        {
            label.text = ""
        }
        signinBtn.isHidden = isLoggedIn
        registerBtn.isHidden = isLoggedIn
        logoutBtn.isHidden = !isLoggedIn
        textField.text = ""
        passField.text = ""

   }

}


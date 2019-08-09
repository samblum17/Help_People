//
//  LoginPageController.swift
//  Help_People
//
//  Created by Darrel Muonekwu on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import UIKit

class LoginPageController: UIViewController {

    @IBOutlet var usernameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func loginPressed(_ sender: Any) {
        
        let baseURL = "https://c1hack.localtunnel.me/login?"
        var userNameQuery = "username=" + usernameText.text!
        var passwordQuery = "password=" + passwordText.text!
        let mainURL = baseURL + userNameQuery + "&" + passwordQuery
        
        let url = URL(string: mainURL)!

        let task = URLSession.shared.dataTask(with: url) { (data,
            response, error) in
            let jsonDecoder = JSONDecoder()
            DispatchQueue.main.async {
                
            if let data = data,
                let userDecoded = try? jsonDecoder.decode(_User.self, from: data) {
            
                if userDecoded.status == true {
                    print("yay")
                    User.name = userDecoded.name
                    User.username = userDecoded.username
                    User.events = userDecoded.events 
                    self.performSegue(withIdentifier: "toHome", sender: nil)
                } else {
                let message = "Invalid credentials"
                    let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                    let okay = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
                    alert.addAction(okay)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        }
        task.resume()

        
        
    }
    

}


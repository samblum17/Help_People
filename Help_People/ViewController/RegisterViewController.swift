//
//  RegisterViewController.swift
//  Help_People
//
//  Created by Dylan Li on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    var firstText: String = ""
    var surnameText: String = ""
    var zipText: String?
    var userText: String?
    var passwordText: String?
    var fullName: String = ""
    
    @IBOutlet weak var welcome_banner: UILabel!
    
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pass1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstname.backgroundColor = .white
        
    }
    
    //    let request = URLRequest(url: NSURL(string: ))
    
    @IBAction func create_user(_ sender: Any) {
        firstText = firstname.text ?? ""
        surnameText = surname.text ?? ""
        zipText = zipcode.text
        userText = username.text
        passwordText = pass1.text
        
        //        if firstText?.isEmpty || surnameText?.isEmpty || zipText?.isEmpty || userText?.isEmpty || passwordText?.isEmpty {
        
        if firstText.isEmpty || surnameText.isEmpty || zipText!.isEmpty || userText!.isEmpty || passwordText!.isEmpty {
            let message = "Please fill out all of the fields below"
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let okay = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            alert.addAction(okay)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        fullName = firstText.trimmingCharacters(in: .whitespaces)
        fullName += "+" + surnameText.trimmingCharacters(in: .whitespaces)
    
            
        performSegue(withIdentifier: "toPreferences", sender: nil)
    }
        //
        //
        //        let url = URL(string: "/register")!
        //        var request = URLRequest(url: url)
        //        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        //        request.httpMethod = "GET"
        //        var query_params = ["username", "&password", "&event_type", "&money_req", "&event_size", "&zip_code"]
        //
        //        var link = query_params[0] + fullname + query_params[1] + password + query_params[2]
        
        //
        //        let parameters: [String: Any] = [
        //            "name": fullName,
        //            "zipcode": zipText,
        //            "password": passwordText,
        //            "username": userText
        //        ]
        //        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        //
        //        if request.httpBody == 0:
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let PreferencesVC = segue.destination as! PreferencesController
        
        let parameters: [String: Any] = [
            "name": fullName,
            "zipcode": zipText,
            "password": passwordText,
            "username": userText
        ]
        
        User.name = fullName
        User.username = userText
        User.events = []
//        User.zipCode = zipText
        

        PreferencesVC.data = parameters
    }
}


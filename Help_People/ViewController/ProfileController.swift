//
//  ProfileController.swift
//  Help_People
//
//  Created by Darrel Muonekwu on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    var activityIndicatorView: UIActivityIndicatorView!

    @IBOutlet var emptyTableView: UIView!
    @IBOutlet var emptyViewLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var eventLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var eventTableView: UITableView!
    
    var data: [String: Any]?
    
    var userEvents: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Profile customization
        
        //Set profile picture to circle
        profileImageView.layer.borderWidth = 1.0
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        profileImageView.clipsToBounds = true
        
        //Tableview setup
        eventTableView.delegate = self
        eventTableView.dataSource = self
        
        eventTableView.separatorStyle = .none
        activityIndicatorView.startAnimating()
        
        self.profileImageView.isHidden = true
        
        //
        var imageURLString = "https://thispersondoesnotexist.com/image"
        var imageURL = URL(string: imageURLString)
        
        let task = URLSession.shared.dataTask(with: imageURL!) { (data,response, error) in
            
            guard let imageData = data else {
                return
            }
            //Highest priority queue
            DispatchQueue.main.async {
                let image = UIImage(data: data!)
                self.profileImageView.image = image
                self.profileImageView.isHidden = false
            }
            
            
        }
        task.resume()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Load in profile info
        var newName = User.name?.replacingOccurrences(of: "+", with: " ")
        nameLabel.text = newName
        usernameLabel.text = User.username
        eventTableView.reloadData()
        
        
        
        //When no events
        
        if User.events?.isEmpty ?? true {
            emptyViewLabel.text = "Welcome to Help People!\nTo join your first event, select one from the home page and sign up."
            emptyTableView.isHidden = false
            activityIndicatorView.stopAnimating()
            eventTableView.separatorStyle = .none
        } else {
            emptyTableView.isHidden = true
            activityIndicatorView.stopAnimating()
            eventTableView.separatorStyle = .singleLine
        }
        
        
    }
    
    


}

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Initial load
        
        let cell = eventTableView.dequeueReusableCell(withIdentifier: "profileEventCell") as! ProfileEventTableViewCell
        cell.eventTitleLabel.text = User.events?[indexPath.row] ?? "Hackathon"
        cell.eventLocationLabel.text = "Clarendon,VA • " + "08/08/19"
        
        
        
        
        return cell
    }
    
    //Load network indicator on background view
    override func loadView() {
        super.loadView()
        
        activityIndicatorView = UIActivityIndicatorView(style: .gray)
        
        eventTableView.backgroundView = activityIndicatorView
    }
}


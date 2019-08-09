//
//  ProfileController.swift
//  Help_People
//
//  Created by Darrel Muonekwu on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var eventLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var eventTableView: UITableView!
    
    
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
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.profileImageView.isHidden = true
        
//
        var imageURLString = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrQCsSPdrdZf2hKyx5qHszrMOFMuXj1nLkxU4eu0pfV_8hIczR"
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
    
    
    
    
    


}

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventTableView.dequeueReusableCell(withIdentifier: "profileEventCell") as! ProfileEventTableViewCell
        cell.eventTitleLabel.text = "Hackathon " + String(indexPath.row)
        cell.eventLocationLabel.text = "Clarendon, VA  •  08/0" + String(indexPath.row)
        
        return cell
    }
}

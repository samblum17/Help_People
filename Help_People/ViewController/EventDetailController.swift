//
//  EventDetailController.swift
//  Help_People
//
//  Created by Darrel Muonekwu on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import UIKit
import AlamofireImage

class EventDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventDescription: UITextView!
    @IBOutlet var tableView: UITableView!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        setUpPage()
    }
    
    @IBAction func joinButtonPressed(_ sender: Any) {
        let message = "You have joined the event for " + eventTitleLabel.text!
        let alert = UIAlertController(title: "Success!", message: message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(okay)
        self.present(alert, animated: true, completion: nil)
        User.events?.append(eventTitleLabel.text ?? "Hackathon")
    }
    
    
    func setUpPage() {
        eventDescription.text = event?.description
        eventTitleLabel.text = event?.name
        let imageURL = URL(string: (event?.pictureURL)!)!
        
        backgroundImage.af_setImage(withURL: imageURL )

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comments = ["Hey this I can wait to attend, I hope a lot of us make it to the end!", "Lets make this a great day everyone. See you all soon.", "Just signed up and im super excited!", "Hey this I can wait to attend, I hope a lot of us make it to the end!"]
        let strings = ["Haden Livid", "Derek Combes", "Aysha Soriano", "Rantin Distianu"]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsCell") as! CommentsCell
        
        cell.usernameLabel.text = strings[indexPath.row]
        cell.commentLabel.text = comments[indexPath.row]
        cell.commentProfileImage.image = UIImage(named: "photo\(indexPath.row)")
        return cell
    }
}

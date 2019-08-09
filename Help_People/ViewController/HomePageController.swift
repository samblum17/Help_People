//
//  HomePageController.swift
//  Help_People
//
//  Created by Darrel Muonekwu on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import UIKit
import AlamofireImage

class HomePageController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var events: [Event]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let description = "This is a discription of the event. here you will talk about the event and let your users know about things like location"

        events = [
            Event(name: "Running a 5K", type: "public", date: "January 7th" , description: description, picture: "https://images.unsplash.com/photo-1449358070958-884ac9579399?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80", money: 5, capacity: 200, numPeple: 12, comments: []),
            Event(name: "Helping the Homeless", type: "public", date: "January 7th" , description: description, picture: "https://images.unsplash.com/photo-1541802645635-11f2286a7482?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80", money: 5, capacity: 200, numPeple: 12, comments: []),
            Event(name: "Doing a Marathon", type: "public", date: "January 7th" , description: description, picture: "https://images.unsplash.com/photo-1452626038306-9aae5e071dd3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1353&q=80", money: 5, capacity: 200, numPeple: 12, comments: [])
        ]
    }
}

extension HomePageController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageCell") as! HomePageCell
        
        cell.eventNameLabel.text = events?[indexPath.row].name
        cell.eventDescription.text = events?[indexPath.row].description
        
        
        let imageURL = URL(string: (events?[indexPath.row].pictureURL)!)
        
        
        cell.eventImage.af_setImage(withURL: imageURL!)
        

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! EventDetailController
        
        let cell = sender as! HomePageCell
        let indexPath = tableView.indexPath(for: cell)
        
        
        destination.event = events?[(indexPath?.row)!]
    }
    
}

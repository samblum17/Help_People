//
//  HomePageController.swift
//  Help_People
//
//  Created by Darrel Muonekwu on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import UIKit

class HomePageController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var events: [Event]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}


extension HomePageController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageCell") as! HomePageCell
        cell.eventNameLabel.text = String(indexPath.row)
        return cell
    }
    
    
}

//
//  EventDetailController.swift
//  Help_People
//
//  Created by Darrel Muonekwu on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import UIKit
import Alamofire

class EventDetailController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventDescription: UITextView!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpPage()
    }
    
    func setUpPage() {
        eventDescription.text = event?.description
        eventTitleLabel.text = event?.name
        let imageURL = URL(string: (event?.pictureURL)!)!
        
        
        backgroundImage.af_setImage(withURL: imageURL )


    }
}

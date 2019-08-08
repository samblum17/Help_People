//
//  ProfileController.swift
//  Help_People
//
//  Created by Darrel Muonekwu on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

    @IBOutlet weak var profileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileLabel.text = "this is my profile"
        profileLabel.textColor = .blue
    }
    


}

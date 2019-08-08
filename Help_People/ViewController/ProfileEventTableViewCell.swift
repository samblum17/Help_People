//
//  ProfileEventTableViewCell.swift
//  Help_People
//
//  Created by Sam Blum on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import UIKit

class ProfileEventTableViewCell: UITableViewCell {

    @IBOutlet var eventTitleLabel: UILabel!
    @IBOutlet var eventLocationLabel: UILabel!
    @IBOutlet var eventImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //Set profile picture to circle
        eventImageView.layer.borderWidth = 1.0
        eventImageView.layer.masksToBounds = false
        eventImageView.layer.borderColor = UIColor.white.cgColor
        eventImageView.layer.cornerRadius = eventImageView.frame.size.height/2
        eventImageView.clipsToBounds = true
        
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

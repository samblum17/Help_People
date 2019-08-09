//
//  Event.swift
//  Help_People
//
//  Created by Darrel Muonekwu on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import Foundation


struct Event {
    var name: String
    var location: String
    var type: String
    var date: String
    var description: String
    var pictureURL: String
    var money: Double
    var capacity: Int
    var numPeople: Int
    var comments: [String]
    
    init(name: String, location: String, type: String, date: String, description: String, picture: String, money: Double, capacity: Int, numPeple: Int, comments: [String]) {
        
        self.name = name
        self.location = location
        self.type = type
        self.date = date
        self.description = description
        self.pictureURL = picture
        self.money = money
        self.capacity = capacity
        self.numPeople = numPeple
        self.comments = comments
    }
    
}

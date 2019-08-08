//
//  Event.swift
//  Help_People
//
//  Created by Darrel Muonekwu on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import Foundation


struct Event {
    var name: String?
    var type: String?
    var date: String?
    var description: String?
    var picture: URL?
    var money: Double?
    var capacity: Int?
    var numPeople: Int?
    var comments: [String]?
    
    init(name: String, date: String) {

    }
    
}

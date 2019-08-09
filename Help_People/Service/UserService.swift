//
//  UserService.swift
//  Help_People
//
//  Created by Darrel Muonekwu on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import Foundation

let User = _User()

class _User: Codable {
    
    var name: String?
    var username: String?
//    var zipCode: String?
//    var profilePicString: String? = "https://thispersondoesnotexist.com/image"
    var status: Bool?
    var events: [String?]?
//    var fakeEvents: [Event]?
    
     init() {
        
    }
}

//
//  User.swift
//  TopQuestion
//
//  Created by Matteo Manferdini on 25/05/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import Foundation

struct User : Decodable {
	let name: String?
	let profileImageURL: URL?
	let reputation: Int?
    
    enum CodingKeys: CodingKey, String {
        case name = "display_name"
        case profileImageURL = "profile_image"
        case reputation
    }
}

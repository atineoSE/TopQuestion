//
//  Question.swift
//  TopQuestion
//
//  Created by Matteo Manferdini on 25/05/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import Foundation

struct Question : Decodable {
	let title: String
	let score: Int
	let tags: [String]
	let date: Date
	let owner: User?
    
    enum CodingKeys: CodingKey, String {
        case title
        case score
        case tags
        case owner
        case date = "creation_date"
    }
}

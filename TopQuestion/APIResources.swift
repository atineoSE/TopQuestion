//
//  APIResources.swift
//  TopQuestion
//
//  Created by Matteo Manferdini on 25/05/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import Foundation

protocol ApiResource {
    associatedtype Model: Decodable
	var methodPath: String { get }
    func makeModel(data: Data) -> [Model]?
}

extension ApiResource {
	var url: URL {
		let baseUrl = "https://api.stackexchange.com/2.2"
		let site = "site=stackoverflow"
		let order = "order=desc"
		let sorting = "sort=votes"
		let tags = "tagged=ios"
		let url = baseUrl + methodPath + "?" + order + "&" + sorting + "&" + tags + "&" + site
		return URL(string: url)!
	}

    func makeModel(data: Data) -> [Model]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        do {
            let models = try decoder.decode(Array<Model>.self, from: data)
            print(models)
            return models
        } catch let error {
            print(error)
            return nil
        }
	}
}

struct QuestionsResource: ApiResource {
    typealias Model = Question
    
	let methodPath = "/questions"
    
}

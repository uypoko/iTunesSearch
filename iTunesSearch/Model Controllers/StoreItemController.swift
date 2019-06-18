//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Ryan on 6/17/19.
//  Copyright © 2019 Caleb Hicks. All rights reserved.
//

import Foundation
struct StoreItemController {
    func fetchItems(matching query: [String: String], completion: @escaping ([StoreItem]?) -> Void) {
        
        let baseURL = URL(string: "https://itunes.apple.com/search?")!
        guard let url = baseURL.withQueries(query) else { return }
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let storeItems = try? jsonDecoder.decode(StoreItems.self, from: data) {
                completion(storeItems.results)
            } else {
                print("Either no data was returned, or data was not serialized")
                completion(nil)
                return
            }
        }
        task.resume()
    }
}

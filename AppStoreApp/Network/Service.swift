//
//  Service.swift
//  AppStoreApp
//
//  Created by hui liu on 8/17/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(searchString: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchString)&entity=software"
        print("1")
        
        fetchGenericJSONData(urlString: urlString, completion: completion)

    }
    
    func fetchGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        
        //fetchHelper(urlString: urlString, completion: completion)
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"

        //fetchHelper(urlString: urlString, completion: completion)
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGroups(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json"

        //fetchHelper(urlString: urlString, completion: completion)
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApp(completion:@escaping ([SocialApp]?, Error?) -> ()  ) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
//    //helper
//    func fetchHelper(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
//
//        fetchGenericJSONData(urlString: urlString, completion: completion)
//    }
    
    // generic json function
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }

               URLSession.shared.dataTask(with: url) { (data, response, error) in
                   if let error = error {
                       completion(nil, error)
                       return
                   }
                   do {
                       let appGroup = try JSONDecoder().decode(T.self, from: data!)
                       completion(appGroup, nil)
                   } catch {
                       completion(nil, error)
                   }
               }.resume()
    }
}

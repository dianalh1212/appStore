//
//  AppGroup.swift
//  AppStoreApp
//
//  Created by hui liu on 9/9/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {    
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}

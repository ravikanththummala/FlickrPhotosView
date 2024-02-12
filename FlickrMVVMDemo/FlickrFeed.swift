//
//  FlickrFeed.swift
//  FlickrMVVMDemo
//
//  Created by Ravikanth  on 2/12/24.
//

import Foundation

// Main feed model
struct FlickrFeed: Codable {
    let title: String
    let link: String
    let description: String
    let modified: String
    let items: [FlickrPhoto]
}

// Individual photo model
struct FlickrPhoto: Codable {
    let title: String
    let link: String
    let media: Media
    let dateTaken: String
    let description: String
    let published: String
    let author: String
    let authorId: String
    let tags: String
    
    enum CodingKeys: String, CodingKey {
        case title, link, media, description, published, author, tags
        case dateTaken = "date_taken"
        case authorId = "author_id"
    }
}

// Media URL model
struct Media: Codable {
    let m: String
}

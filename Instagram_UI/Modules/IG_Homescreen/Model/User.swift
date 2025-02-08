//
//  User.swift
//  Instagram_UI
//
//  Created by jo on 27/12/24.
//


import Foundation

// MARK: - User Model
struct User: Identifiable, Codable {
    var id: Int
    var name: String
    var online: Bool
    var live : Bool
    var picture: Picture
    var posts: [Post]?
    var comments: [Comment]?
}

// MARK: - Picture Model
struct Picture: Codable {
    var imageUrl: String
}

// MARK: - Post Model
struct Post: Identifiable, Codable {
    var id: Int
    var content: String
    var userId: Int
    var comments: [Comment]?
    var photos: [Picture]?
}

// MARK: - Comment Model
struct Comment: Identifiable, Codable {
    var id: Int
    var text: String
    var postId: Int
}

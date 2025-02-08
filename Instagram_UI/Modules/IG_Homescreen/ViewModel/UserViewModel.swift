//
//  UserViewModel.swift
//  Instagram_UI
//
//  Created by jo on 27/12/24.
//

import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading: Bool = false

    private var currentPage = 1
    private let pageLimt = 10
    

    func loadUsers() {
        guard !isLoading else { return }
        
        isLoading = true
        fetchUsers(page: currentPage, pageSize: pageLimt)
    }
    
    private func fetchUsers(page: Int, pageSize: Int) {
        // Simulate a network request or API call with fake data
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let newUsers = generateFakeUsers(count: pageSize)
            
            DispatchQueue.main.async {
                self.users.append(contentsOf: newUsers)
                self.isLoading = false
                self.currentPage += 1
                
            }
        }
    }
}
import Fakery
// Function to print JSON in a readable format
func printPrettyJson(json: [String: Any]) {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)  // Prints formatted JSON to console
        }
    } catch {
        print("Error printing JSON: \(error)")
    }
}
func generateFakeUsers(count: Int) -> [User] {
    var users: [User] = []
    
    let faker = Faker(locale: "en")
    
    for id in 1...count {
        let user = User(
            id: id,
            name: faker.name.firstName(),
            online: Bool.random(),
            live: Bool.random(),
            picture: Picture(imageUrl: "https://picsum.photos/200/300"),
            posts: generateFakePosts(userId: id),
            comments: generateFakeComments(userId: id)
        )
       
        users.append(user)
        print(user.picture.imageUrl)
    }
 
    return users
}

func generateFakePosts(userId: Int) -> [Post] {
    var posts: [Post] = []
    
    for id in 1...5 {
        let post = Post(
            id: id,
            content: "Post Content \(id)",
            userId: userId,
            comments: generateFakeComments(userId: userId),
            photos: generateImageURLS()
        )
        posts.append(post)
    }
    
    return posts
}

func generateImageURLS()-> [Picture] {
    var photos: [Picture] = []
    for i in 1...3 {
        let pic = Picture(imageUrl: "https://picsum.photos/200/300")
        photos.append(pic)
    }
    return photos
}

func generateFakeComments(userId: Int) -> [Comment] {
    var comments: [Comment] = []
    
    for id in 1...3 {
        let comment = Comment(
            id: id,
            text: "Comment text for user \(userId) \(id)",
            postId: id
        )
        comments.append(comment)
    }
    
    return comments
}
/*
 (id: 1,
  name: "Cara",
  online: false,
  picture: Instagram_UI.Picture(imageUrl: [48, 48]),
  posts: Optional([
      Instagram_UI.Post(id: 1, content: "Post Content 1", userId: 1, comments: Optional([
          Instagram_UI.Comment(id: 1, text: "Comment text for user 1 1", postId: 1),
          Instagram_UI.Comment(id: 2, text: "Comment text for user 1 2", postId: 2),
          Instagram_UI.Comment(id: 3, text: "Comment text for user 1 3", postId: 3)
      ])),
      
      Instagram_UI.Post(id: 2, content: "Post Content 2", userId: 1, comments: Optional([
          Instagram_UI.Comment(id: 1, text: "Comment text for user 1 1", postId: 1),
          Instagram_UI.Comment(id: 2, text: "Comment text for user 1 2", postId: 2),
          Instagram_UI.Comment(id: 3, text: "Comment text for user 1 3", postId: 3)
      ])),
      
      Instagram_UI.Post(id: 3, content: "Post Content 3", userId: 1, comments: Optional([
          Instagram_UI.Comment(id: 1, text: "Comment text for user 1 1", postId: 1),
          Instagram_UI.Comment(id: 2, text: "Comment text for user 1 2", postId: 2),
          Instagram_UI.Comment(id: 3, text: "Comment text for user 1 3", postId: 3)
      ])),
      
      Instagram_UI.Post(id: 4, content: "Post Content 4", userId: 1, comments: Optional([
          Instagram_UI.Comment(id: 1, text: "Comment text for user 1 1", postId: 1),
          Instagram_UI.Comment(id: 2, text: "Comment text for user 1 2", postId: 2),
          Instagram_UI.Comment(id: 3, text: "Comment text for user 1 3", postId: 3)
      ])),
      
      Instagram_UI.Post(id: 5, content: "Post Content 5", userId: 1, comments: Optional([
          Instagram_UI.Comment(id: 1, text: "Comment text for user 1 1", postId: 1),
          Instagram_UI.Comment(id: 2, text: "Comment text for user 1 2", postId: 2),
          Instagram_UI.Comment(id: 3, text: "Comment text for user 1 3", postId: 3)
      ]))
  ]),
  comments: Optional([
      Instagram_UI.Comment(id: 1, text: "Comment text for user 1 1", postId: 1),
      Instagram_UI.Comment(id: 2, text: "Comment text for user 1 2", postId: 2),
      Instagram_UI.Comment(id: 3, text: "Comment text for user 1 3", postId: 3)
  ])
 )

 */

//
//  IG_SearchModel.swift
//  Instagram_UI
//
//  Created by jo on 31/12/24.
//

/*
 [
     {
         "id": "0",
         "author": "Alejandro Escamilla",
         "width": 5616,
         "height": 3744,
         "url": "https://unsplash.com/...",
         "download_url": "https://picsum.photos/..."
     }
 ]
 */

struct Card: Identifiable,Codable,Hashable {
    let id : String
    let author : String
    let width : Int
    let height : Int
    let url : String
    let download_url : String
}

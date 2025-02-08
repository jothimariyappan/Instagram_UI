//
//  IG_SearchViewModel.swift
//  Instagram_UI
//
//  Created by jo on 31/12/24.
//

import Foundation
class IG_SearchViewModel : ObservableObject {
    
    @Published var search               : String = ""
    @Published var cards                : [Card] = []
    @Published var compositionalArray   : [[Card]] = []
    @Published var hasgtags             : [String] = []
    
    init() {
        makeapicall()
        getHashtags()
    }
    
    func getHashtags(){
        for hashtage in IG_SearchHastags.allCases {
            hasgtags.append(hashtage.rawValue)
        }
    }
    func makeapicall(){
        let urlRequest = URL(string: "https://picsum.photos/v2/list?page=2&limit=20")!
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("DEBUG_ERROR: error received from server : \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("DEBUG_ERROR: data not received from server")
                return }
            
            do{
                let Decodedresponse = try JSONDecoder().decode([Card].self, from: data)
                DispatchQueue.main.async {
                    self.cards = Decodedresponse
                    self.setcompositionalArray()
                }
                
              
               
            }catch(let error){
                print("DEBUG_ERROR: Data not decoded : \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    func setcompositionalArray(){
        var currentarraycards = [Card]()
        
        cards.forEach { card in
            currentarraycards.append(card)
            if currentarraycards.count == 3 {
                compositionalArray.append(currentarraycards)
                currentarraycards.removeAll()
            }
            
            if currentarraycards.count != 3 && card.id == cards.last!.id{
                compositionalArray.append(currentarraycards)
                currentarraycards.removeAll()
            }
        }
    }
}

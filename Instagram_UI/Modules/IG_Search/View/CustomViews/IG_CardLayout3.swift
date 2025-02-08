//
//  IG.swift
//  Instagram_UI
//
//  Created by jo on 31/12/24.
//

import SwiftUI
import SDWebImageSwiftUI


struct IG_CardLayout3: View {
    var card : [Card]
    var width = UIScreen.main.bounds.width - 30
    var body: some View {
        HStack(spacing: 5) {
            
            VStack(spacing: 5){
                
                if card.count >= 2 {
                    AnimatedImage(url: URL(string:card[0].download_url))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: (width / 3),height: 123,alignment: .center)
                        .cornerRadius(5)
                        .modifier(ContextModifier(card: card[0]))
                }
                if card.count == 3 {
                    AnimatedImage(url: URL(string:card[1].download_url))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:(width / 3),height: 123,alignment: .center)
                        .cornerRadius(5)
                        .modifier(ContextModifier(card: card[1]))
                    
                }
            }
            .frame(maxHeight: .infinity,alignment: .top)
            AnimatedImage(url: URL(string:card[2].download_url))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width - (width / 3),height: 250,alignment: .center)
                .cornerRadius(5)
                .modifier(ContextModifier(card: card[2]))
                


        }
        .frame(maxWidth: .infinity,alignment: .trailing)
    }
}

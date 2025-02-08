//
//  ContextModifier.swift
//  Instagram_UI
//
//  Created by jo on 31/12/24.
//

import SwiftUI

struct ContextModifier: ViewModifier {
    var card : Card
    
    func body(content: Content) -> some View {
        content
            .contextMenu {
                Text("by \(card.author)")
            }
            .contentShape(RoundedRectangle(cornerRadius: 5))
    }
}



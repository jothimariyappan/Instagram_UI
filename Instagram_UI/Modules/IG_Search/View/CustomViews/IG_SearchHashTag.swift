//
//  IG_SearchHashTag.swift
//  Instagram_UI
//
//  Created by jo on 03/01/25.
//

import SwiftUI

struct IG_SearchHashTag: View {
    var title : String
    var body: some View {
        HStack {
            Image(systemName: "appletv")
            Text(title)
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white) // Background color inside the rectangle
                )
        )
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5) // Improved shadow

       
        
        
    }
}

#Preview {
    IG_SearchHashTag(title: "IGTV")
}

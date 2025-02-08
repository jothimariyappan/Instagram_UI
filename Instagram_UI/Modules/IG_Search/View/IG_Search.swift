//
//  IG_Search.swift
//  Instagram_UI
//
//  Created by jo on 31/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct IG_Search: View {
    
    @State var txt_search : String = ""
    @StateObject var SeachVM = IG_SearchViewModel()
    var body: some View {
        VStack {
            ///`Search bar`
            HStack {
                HStack{
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                        
                    TextField("Search", text: $txt_search)
                }
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(Color.primary.opacity(0.06))
                .cornerRadius(10)
                
                Button {
                    //
                } label: {
                    Image(systemName: "qrcode.viewfinder")
                        .font(.system(size: 30))
                        .foregroundColor(.primary)
                }

               
                
            }
            .padding()
            ///`HashTags Content`
            ScrollView(.horizontal){
                LazyHStack(spacing: 10){
                    ForEach(SeachVM.hasgtags,id:\.self) { tags in
                        IG_SearchHashTag(title: tags.capitalized)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .frame(height: 50)
            .padding(.top,-10)
            .padding(.horizontal,10)
            .frame(maxWidth: .infinity)
            ///`Grid Content`
            ScrollView {
                LazyVStack{
                    
                    ForEach(SeachVM.compositionalArray.indices, id:\.self) { index in
                        layout(Index: index)
                    }
                }
            }
            .padding()
            .ignoresSafeArea()
            
        }
    }
    
    private func layout(Index:Int) -> some View {
        if Index == 0 || Index % 6 == 0 {
            return AnyView(IG_CardLayout1(card: SeachVM.compositionalArray[Index]))
        }else if Index % 3 == 0{
            return AnyView(IG_CardLayout3(card: SeachVM.compositionalArray[Index]))
        }else{
            return AnyView(IG_CardLayout2(card: SeachVM.compositionalArray[Index]))
        }
    }
}

#Preview {
    IG_Search()
   
}

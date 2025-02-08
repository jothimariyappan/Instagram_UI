//
//  IG_postview.swift
//  Instagram_UI
//
//  Created by jo on 27/12/24.
//

import SwiftUI

struct IG_postview: View {
    var imageURL : String
//    var imagesURL : [String] = []
    var imagesURL : [String] = ["https://picsum.photos/200/300","https://picsum.photos/200/300",
                               "https://picsum.photos/200/300"]
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(alignment: .center){
                // Post info -> hstack
                PostInfoStack(isStoryPosted: true,imageURL: imageURL)
                // Post content in center
                Rectangle()
                    .overlay {
                        TabView {
                                ForEach(imagesURL,id:\.self) { images in
                                    AsyncImage(url: URL(string: images)) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 375)
                                        case .failure(_):
                                            Image("postimage")
                                                .resizable()
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 375)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                }
                                
                            
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))

                        
                       
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 375)
               
                // Post likes info -> hstack
                Group {
                    LikeActionStack()
                    // post Caption
                    PostLikeinfo()
                }
                .padding(.horizontal,5)
                
                Postcaptioninfo()
                    .padding(.horizontal,2)
            }
            .padding(.vertical,5)
        }
    }
}

#Preview {

    IG_postview(imageURL: "https://picsum.photos/200/300")
}

struct PostInfoStack :View {
  var isStoryPosted : Bool
    var imageURL : String
    var body: some View {
        HStack(alignment: .center,spacing: 20) {
            Profileview(size: .medium, isOnline: isStoryPosted,imageURL: imageURL)
                .frame(width:20, height: 20)
            VStack(alignment: .leading,spacing: 0) {
                HStack {
                    Text("joshua_l")
                        .fontWeight(.medium)
                    Image("verified")
                        .resizable()
                        .frame(width: 15,height: 15)
                }
                Text("Tokyo, Japan")
                    .font(.subheadline)
                    .fontWeight(.regular)
            }
            Spacer()
            Image(systemName: "ellipsis")
                .foregroundColor(.black)
            
        }
        .padding(.vertical,5)
        .padding(.horizontal,20)
    }
}


struct LikeActionStack: View {
    var body: some View {
        HStack{
            HStack(spacing: 10){
                    Image(systemName: "heart")
                    Image(systemName: "message")
                    Image(systemName: "paperplane")
            }
            Spacer()
            
            pagecontroll
            
            Spacer()
            Spacer()
            Image(systemName: "bookmark")
        }

        .imageScale(.large)

    }
    
    private var pagecontroll : some View {
        HStack{
            Circle()
                .foregroundColor(.blue)
            Circle()
                .foregroundColor(.gray)
            Circle()
                .foregroundColor(.gray)
        }
        .frame(width:30 ,height:30)
        
    }
}


struct PostLikeinfo : View {
    var body: some View {
        HStack{
            Image("User_profile_image")
                .resizable()
                .frame(width:17, height: 17)
            
            Text("Liked by ") +
            Text("craig_love ")
                .fontWeight(.semibold) +
            Text("and ") +
            Text("44,686 others ")
                .fontWeight(.semibold)
           
            Spacer()
        }
    }
}

struct Postcaptioninfo : View {
    var body: some View {
        Text("joshua_l The game in Japan was amazing and I want to share some photos")
            .lineLimit(3)
    }
}

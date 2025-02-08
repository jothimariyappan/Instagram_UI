//
//  IG_storyview.swift
//  Instagram_UI
//
//  Created by jo on 27/12/24.
//

import SwiftUI



struct IG_storyview: View {
    
    var username: String
    var isLive: Bool
    var isOnline: Bool
    var imageURL :String
    var body: some View {
        ZStack {
          
            VStack(spacing: 10) {
                ZStack(alignment: .bottom) {
                    Profileview(size: .large,isOnline: isOnline,imageURL: imageURL)
                    
                    if isLive {
                        Text("Live")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical,2)
                            .padding(.horizontal,2)
                            .background(
                                Color.pink
                                    .cornerRadius(5)
                            )
                            .padding(.bottom, -8)
                        
                            .overlay( // Overlay for a white border
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white, lineWidth: 2)
                                    .padding(.bottom, -8)
                            )
                        
                    }
                }
                Text(username)
                    .font(.caption)
                    .frame(maxWidth: 62)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
            }
            .frame(width: 62,height: 82)
        }
    }
}

#Preview {
   
    IG_storyview(username: "jothi", isLive: true, isOnline: true, imageURL: "https://picsum.photos/200/300")
    
}
enum Constants : String {
    case imageURL = "https://picsum.photos/200/300"
}
struct Profileview: View {
     var size : ImageSize
     var isOnline : Bool
    var imageURL : String? = nil
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL ?? "https://picsum.photos/200/300")) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: size.imageSize, height: size.imageSize)
            case .success(let image):
                
                image
                    .resizable()
                    .frame(width: size.imageSize,height: size.imageSize)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(isOnline ? Color.pink : Color.white,
                                    lineWidth: size.borderWidth)
                            .frame(width: size.overlaySize,height: size.overlaySize)
                    }
            case .failure(_):
                Image("fallback_image") // Replace with your fallback image name
                                 .resizable()
                                 .frame(width: size.imageSize, height: size.imageSize)
                                 .aspectRatio(contentMode: .fit)
                                 .clipShape(Circle())
                                 .overlay {
                                     Circle()
                                         .stroke(isOnline ? Color.pink : Color.white, lineWidth: size.borderWidth)
                                         .frame(width: size.overlaySize, height: size.overlaySize)
                                 }
            @unknown default:
                EmptyView()
            }
        }
     
    }
}
enum ImageSize {
    case small
    case medium
    case large
    case extralarge
    
    var imageSize :CGFloat {
        switch self {
        case .small:
            return 17
        case .medium:
            return 32
        case .large:
            return 62
        case .extralarge:
            return 92
        }
    }
    
    var overlaySize: CGFloat {
            imageSize + 6 // Border adds extra space
        }
        
        var borderWidth: CGFloat {
            2 // Fixed width for simplicity
        }
}

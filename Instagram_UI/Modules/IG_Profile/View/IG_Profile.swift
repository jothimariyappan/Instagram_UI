//
//  IG_Profile.swift
//  Instagram_UI
//
//  Created by jo on 03/01/25.
//

import SwiftUI

struct IG_Profile: View {
    let layout = GridItem(.flexible(minimum: 100, maximum: 100), spacing: 0, alignment: .center)
    let screenSize = UIScreen.main.bounds
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading,spacing: 10) {
                    HStack {
                        Spacer()
                        account
                        Spacer()
                        Image(systemName: "line.3.horizontal")
                    }
                    .padding(.horizontal,10)
                    profilesection
                    profileBio
                }
                
                NavigationLink {
                    //
                } label: {
                    Text("Edit Profile")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,5)
                        .font(.title3)
                        .foregroundColor(.black)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                            
                                .stroke(Color.gray,lineWidth:1)
                        }
                    
                }
                .padding(.horizontal,15)
                .padding(.top ,10)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 15){
                        ForEach(1..<10) { data in
                            IG_storyview(username: "jothi", isLive: false, isOnline: true, imageURL: Constants.imageURL.rawValue)
                        }
                        
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal,10)
                }
                
                Divider()
                ScrollView(.vertical){
                    LazyVGrid(columns: [layout]) {
                        ForEach(0..<20) { data in
                            
                            HStack(spacing: 0) {
                                ForEach(0...2,id:\.self, content: { data in
                                    AsyncImage(url: URL(string: Constants.imageURL.rawValue)) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                                .frame(width: self.screenSize.width / 3, height: self.screenSize.height / 3)
                                        case .success(let image):
                                            
                                            image
                                                .resizable()
                                                .frame(width: self.screenSize.width / 3, height: self.screenSize.height / 5)
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(Rectangle())
                                            
                                        case .failure(_):
                                            Image("fallback_image") // Replace with your fallback image name
                                                .resizable()
                                                .frame(width: self.screenSize.width / 3, height: self.screenSize.height / 5)
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(Rectangle())
                                            
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                })
                            }
                        }
                    }
                }
            }
                
                Spacer()
                
                
            }
          
        
    }
    
    private var account : some View {
        HStack{
            Image(systemName: "lock")
            Button {
                //
            } label: {
                HStack {
                    Text("jothi")
                    Image(systemName: "chevron.down")
                }
                .foregroundColor(.black)
               
            }

        }
    }
    
    private var profilesection : some View {
        
        HStack(alignment: .center,spacing: 25){
            Profileview(size: .extralarge,
                        isOnline: true,
                        imageURL: "https://picsum.photos/200/300")
                        .padding(.leading,-30)
            
                VStack {
                    Text("54")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Posts")
                        .font(.callout)
                }
                
                
                VStack {
                    Text("854")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Followers")
                        .font(.callout)
                }
                VStack {
                    Text("162")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Following")
                        .font(.callout)
                }
            
        }
        .frame(maxWidth: .infinity)
    }
    
    private var profileBio : some View {
        VStack(alignment: .leading,spacing: 5) {
            Text("J.o.t.h.i.m.a.r.i.y.a.p.p.a.n")
                .font(.callout)
            Group {
                Text("Digital goodies designer @pixselzz")
                Text("Everything is designed")
            }
            .font(.caption)
            
        }
        .padding(.horizontal,10)
    }
}

#Preview {
    IG_Profile()
}

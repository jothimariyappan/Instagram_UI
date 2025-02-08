//
//  IG_Homescreen.swift
//  Instagram_UI
//
//  Created by jo on 25/12/24.
//


import SwiftUI

struct IG_Homescreen: View {
    @StateObject var userViewModel = UserViewModel()
    
    let adaptive: [GridItem] = [GridItem()]
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.white.ignoresSafeArea() // Background color
               
                VStack {
                    ScrollView {
                        // IG_Story view -> section
                        VStack(spacing: 0) {
                            Divider()
                                .padding(.bottom, -30)
                            
                            Section {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 0) {
                                        ForEach(userViewModel.users) { user in
                                            IG_storyview(
                                                username: user.name,
                                                isLive : user.live,
                                                isOnline: true,
                                                imageURL: user.picture.imageUrl
                                            )
                                            .frame(width: 62, height: 82)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 15)
                                        }
                                    }
                                }
                            }
                            
                            Divider()
                                .padding(.bottom, 10)
                        
                            // Second section
                            Section {
                                ScrollView {
                                    LazyVStack {
                                        ForEach(userViewModel.users) { post in
                                            IG_postview(imageURL: post.picture.imageUrl)
                                            Divider()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("Instagram Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .accessibilityLabel("Instagram Logo")
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            print("Camera tapped")
                        }) {
                            Image("camera")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .accessibilityLabel("Camera")
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            print("Messages tapped")
                        }) {
                            Image("IGTV")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .accessibilityLabel("Messages")
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            print("Messages tapped")
                        }) {
                            Image("paperplane")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .accessibilityLabel("Messages")
                        }
                    }
                }
            }
            .onAppear {
                userViewModel.loadUsers()
                
            }
        }
    }
}


#Preview {
    IG_Homescreen()
}

//
//  ContentView.swift
//  Instagram_UI
//
//  Created by jo on 25/12/24.
//

import SwiftUI

struct IGAuthorization: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                Image("Instagram Logo")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding(.bottom ,50)
                Circle()
                    .frame(width: 85,height: 85)
                    .overlay {
                        Image("User_profile_image")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 85, height: 85)
                            .clipShape(Circle())
                    }
                
                Button {
                    //
                } label: {
                    NavigationLink(destination: IG_Login()) {
                        Text("Log in")
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(AppColors.IG_Blue
                                .cornerRadius(10))
                            .foregroundColor(.white)
                            
                    }
                  
                    
                }
                
                Text("Switch accounts")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .foregroundColor(.blue)
                    .font(.system(size: 14))
                
                Spacer()
                
                Divider()
                
                Text("Don't have an account? ") +
                Text("Sign up.")
                    .fontWeight(.bold)
                
                
            }
            .padding()
        }
    }
}

#Preview {
    IGAuthorization()
}


//
//  IG_Login.swift
//  Instagram_UI
//
//  Created by jo on 25/12/24.
//

import SwiftUI
struct IG_Login: View {
    @State var txt : String = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
            ZStack {
                VStack(spacing: 20) {
                    Spacer()
                    Image("Instagram Logo")
                        .padding(.bottom , 50)
                    Group {
                        TextField("User name", text: $txt)
                        TextField("Password", text: $txt)
                    }
                    .padding()
                    .background(
                        Color.black.brightness(0.9)
                            .cornerRadius(5)
                    )
                    
                    HStack{
                        Spacer()
                        Text("Forget password?")
                        
                            .foregroundColor(.blue)
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                    Text("Log in")
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(AppColors.IG_Blue
                            .cornerRadius(10))
                        .foregroundColor(.white)
                    
                    HStack(){
                        
                        Image("facebook_logo")
                        Text("Log in with Facebook")
                            .frame(height: 44)
                            .foregroundColor(.blue)
                            .font(.system(size: 14))
                        
                    }
                    .padding(.bottom,10)
                    
                    
                    HStack {
                        Image(systemName: "line.diagonal")
                            .resizable()
                            .frame(width: 150,height: 5)
                            .rotationEffect(.degrees(2))
                        Text("OR")
                            .padding(.vertical)
                        
                        Image(systemName: "line.diagonal")
                            .resizable()
                            .frame(width: 150,height: 5)
                            .rotationEffect(.degrees(2))
                    }
                    .padding(.bottom,10)
                    Text("Don’t have an account?") +
                    Text(" Sign up.")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Spacer()
                    
                    Divider()
                    Text("Instagram от Facebook")
                    
                }
                .padding()
                
                
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                                   dismiss()
                               }) {
                                   Image(systemName:"chevron.backward") 
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 24, height: 24)
                                       .foregroundColor(.black)
                               }
                }
            }
        
    }
}


#Preview {
    IG_Login()
}
//.navigationBarHidden(true)
//.navigationBarTitleDisplayMode(.inline)
//.navigationBarItems(leading: Button(action: {
//    // Handle back action here
//}) {
//    Image(systemName: "chevron.backward")
//        .imageScale(.large)
//        .foregroundColor(.black)
//})

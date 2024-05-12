//
//  LoginView.swift
//  LanguageLearningApp
//
//  Created by Ali Agha Jafari on 12/5/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State var WrongUsername: Float = 0
    @State var WrongPassword: Float = 0
    @ObservedObject private var loginViewModel = LoginViewModel()

    var body: some View {
        NavigationView{
            
            VStack{
              Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(.bottom,42)
                VStack(spacing:16.0){
                    TextField("Username", text: $loginViewModel.username )
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .border(.red,width: CGFloat(WrongUsername)) // gets different value if username is not valid
                        .background(Color.black.opacity((0.1)))
                    SecureField("Password", text:$loginViewModel.password )
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .border(.red,width: CGFloat(WrongUsername)) // gets different value if password is not valid
                        .background(Color.black.opacity((0.1)))
                    
                      
                    Button("Login") {
                        if let user = loginViewModel.login() {
                                print("\(user.name ?? "")")
                            } else {
                                print("No users found")
                                // Set flag for wrong username or password
//                                wrongUsername = true
//                                wrongPassword = true
                                            }
                                        }
                    .frame(width: 300, height: 50)
                    .foregroundColor(.black)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .font(.title3)
                    
                    NavigationLink(destination: SignUpView()){
                        Text("Sign up")
                            .frame(width: 300, height: 50)
                            .foregroundColor(.black)
                            .background(Color.orange)
                            .cornerRadius(10)
                            .font(.title3)
                    }
                    
                
                    
                }
                .padding()
                
            }
            
        }
        
    }
}

#Preview {
    LoginView()
}

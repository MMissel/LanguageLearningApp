//
//  LoginView.swift
//  LanguageLearningApp
//
//  Created by Ali Agha Jafari on 12/5/2024.
//

import SwiftUI

struct LoginView: View {
    @State var wrongUsername: Float = 0
    @State var wrongPassword: Float = 0
//    @ObservedObject private var loginViewModel = LoginViewModel()
    @Binding var isLoggedIn: Bool // Track login status
    @StateObject var registerViewModel = RegisterViewModel()
    
    @State var username: String = ""
    @State var password : String = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(.bottom, 42)
                
                VStack(spacing: 16.0) {
                    TextField("Username", text: $username)
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .border(Color.red, width: CGFloat(wrongUsername))
                        .background(Color.black.opacity(0.1))
                    
                    SecureField("Password", text: $password)
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .border(Color.red, width: CGFloat(wrongPassword))
                        .background(Color.black.opacity(0.1))
                    
                    Button("Login") {
//                        if let user = $registerViewModel.() {
//                            print("\(user.name ?? "")")
//                            isLoggedIn = true // Set login status to true
                        
//                        } else {
//                            print("No users found")
//                            // Set flag for wrong username or password
//                            // wrongUsername = true
//                            // wrongPassword = true
//                        }
                        if let user = registerViewModel.fetchUser(username: username, password: password){
                            print("\(user.name)")
                        }else{
                            print("No users found")
                        }
                    }
                    .frame(width: 300, height: 50)
                    .foregroundColor(.black)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .font(.title3)
                    
                    NavigationLink(destination: SignUpView()) {
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

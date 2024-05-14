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

    @StateObject var registerViewModel = RegisterViewModel()
    @ObservedObject var loginViewModel : LoginViewModel
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
                    
                    if wrongUsername > 0 || wrongPassword > 0 {
                        Text("Incorrect username or password")
                            .foregroundColor(.red)
                    }
                    Button("Login") {
                        if !username.isEmpty && !password.isEmpty {
                                if let user = registerViewModel.fetchUser(username: username, password: password) {
                                    print("\(user.name)")
                                    loginViewModel.login(userEntity: user)
                                    wrongUsername = 0
                                    wrongPassword = 0
                                } else {
                                    // Set the state variables to indicate wrong username/password
                                    wrongUsername = 2
                                    wrongPassword = 2
                                }
                            } else {
                                // Set the state variables to indicate empty username/password
                                wrongUsername = 2
                                wrongPassword = 2
                            }
                    }
                    .frame(width: 300, height: 50)
                    .foregroundColor(.black)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .font(.title3)
                    
                    NavigationLink(destination: SignUpView(loginViewModel: loginViewModel).environment(\.managedObjectContext, registerViewModel.container.viewContext)
) {
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

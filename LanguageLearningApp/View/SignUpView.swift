//
//  Signup.swift
//  loginPage
//
//  Created by Ali Agha Jafari on 5/5/2024.
//

import SwiftUI
import CoreData
struct SignUpView: View {
    @Environment (\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) var managedObjContext
    @ObservedObject var loginViewModel : LoginViewModel
    
    @State var username : String = ""
    @State var password : String = ""
    @State var name : String = ""
    
    @State var WrongUsername: Float = 0
    @State var WrongPassword: Float = 0
    @State var isLoggedIn : Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                Text("New User")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(.bottom,42)
                VStack(spacing:16.0){
                    
                    TextField("Name", text: $name )
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .border(.red, width: CGFloat(WrongUsername))
                        .background(Color.black.opacity((0.1)))
                    TextField("Username", text: $username )
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .border(.red, width: CGFloat(WrongUsername))
                        .background(Color.black.opacity((0.1)))
                    SecureField("Password", text: $password )
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .border(.red, width: CGFloat(WrongUsername))
                        .background(Color.black.opacity((0.1)))
                    
                    
                        Button("Signup") {
                        if !name.isEmpty && !username.isEmpty && !password.isEmpty {
                            RegisterViewModel().addUser(name: name, username: username, password: password, context: managedObjContext)
                            dismiss()
                        } else {
                        // Set the state variables to indicate empty fields
                            WrongUsername = 2
                            WrongPassword = 2
                                                    }
                        }
                        .frame(width: 300, height: 50)
                        .foregroundColor(.black)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .font(.title3)
                                            
                    
                }
                .padding()
                
            }
        }
    }
}

#Preview {
    SignUpView(loginViewModel: LoginViewModel())
}

//
//  Signup.swift
//  loginPage
//
//  Created by Ali Agha Jafari on 5/5/2024.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismiss
    
    @State var username : String = ""
    @State var password : String = ""
    @State var name : String = ""
    
    @State var WrongUsername: Float = 0
    @State var WrongPassword: Float = 0
    
    var body: some View {
        NavigationView{
            VStack{
              Text("New User")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(.bottom,42)
                VStack(spacing:16.0){
                    
                    TextField("Name", text:$name )
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .border(.red,width: CGFloat(WrongUsername)) // gets different value if username is not valid
                        .background(Color.black.opacity((0.1)))
                    TextField("Username", text:$username )
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .border(.red,width: CGFloat(WrongUsername)) // gets different value if username is not valid
                        .background(Color.black.opacity((0.1)))
                    SecureField("Password", text:$password )
                        .padding(.horizontal, 10)
                        .frame(height: 42)
                        .border(.red,width: CGFloat(WrongUsername)) // gets different value if password is not valid
                        .background(Color.black.opacity((0.1)))
                    
                   
                    
                    
                    Button("Signup"){
                        DataController().addUser(name: name, username: username, password: password, context: managedObjContext)
                        // dismiss this view if you want and go to login view
//                        dismiss()
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
    SignUpView()
}

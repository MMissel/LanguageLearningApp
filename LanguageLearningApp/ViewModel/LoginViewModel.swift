//
//  LoginViewModel.swift
//  LanguageLearningApp
//
//  Created by Ali Agha Jafari on 12/5/2024.
//

import Foundation
class LoginViewModel: ObservableObject{
    @Published var username: String = ""
    @Published var password : String = ""
   
    private var dataController = DataController()
        
    func login() -> User? {
            return dataController.fetchUser(username: username, password: password)
    }
}

//
//  loginViewModel.swift
//  LanguageLearningApp
//
//  Created by Ali Agha Jafari on 14/5/2024.
//

import Foundation
class LoginViewModel : ObservableObject{
    @Published var isLoggedIn: Bool = false
    @Published var userLoggedIn: UserEntity = UserEntity()
    func login(userEntity: UserEntity){
        self.isLoggedIn = true
    }
}

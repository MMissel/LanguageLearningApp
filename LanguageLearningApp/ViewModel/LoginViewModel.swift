//
//  loginViewModel.swift
//  LanguageLearningApp
//
//  Created by Ali Agha Jafari on 14/5/2024.
//

import Foundation
class LoginViewModel : ObservableObject{
    
    @Published var isLoggedIn: Bool = false
//    @Published var userLoggedIn: UserEntity = UserEntity()
    @Published var userId = UUID()
    
    func login(userId: UUID){
        self.isLoggedIn = true
//        self.userLoggedIn = userEntity
        self.userId = userId
        
    }
    
    func logout() {
            self.isLoggedIn = false
            self.userId = UUID()
    }
}

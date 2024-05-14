//
//  LanguageLearningAppApp.swift
//  LanguageLearningApp
//
//  Created by User on 30/4/2024.
//

import SwiftUI

@main
struct LanguageLearningAppApp: App {
    //here we create a data controller that can be used anywhere in the app
    //lets us access data in the database.
    @StateObject private var registerViewModel = RegisterViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainMenuView()
                    .environment(\.managedObjectContext, registerViewModel.container.viewContext)
            }
        }
    }
}

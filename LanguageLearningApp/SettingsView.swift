//
//  SettingsView.swift
//  LanguageLearningApp
//
//  Created by User on 1/5/2024.
//

import SwiftUI
//this page appears before the quiz begins
//it allows you to select your quiz preferences
//also allows you to input your name and such
struct SettingsView: View {
    var body: some View {
        VStack(spacing: 20) { // Added spacing between views
            Text("Quiz Preferences")
            Spacer()
            NavigationLink(destination: QuizView()){
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2)
                    .frame(width: 200, height: 40) // Adjusted frame size
                    .overlay(
                        Text("Begin").padding()
                    )
            }
            Spacer()
        }
        .padding()

        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SettingsView()
        }
        
    }
}

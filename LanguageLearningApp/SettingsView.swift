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
    //default number of letters
    @State var numberOfLetters: Double = 23
    //will hold the default number of letters to pass between views
    @AppStorage("LETTER_COUNT_KEY") var maxLetterCount: Double = 0
    //so we can set the score to 0 before restarting the quiz
    @AppStorage("SCORE_KEY") var quizScore: Int = 0

    var body: some View {
        VStack(spacing: 20) { // Added spacing between views
            Text("Quiz Preferences").font(.title).foregroundColor(.red)
            Spacer()
            Text("Number of letters: \(Int(numberOfLetters))")
            Slider(value: $numberOfLetters, in: 1...46, step: 1).padding()
            NavigationLink(destination: QuizView().navigationBarBackButtonHidden(true)){
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
        .onDisappear{
            maxLetterCount = numberOfLetters
            quizScore = 0
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SettingsView()
        }
        
    }
}

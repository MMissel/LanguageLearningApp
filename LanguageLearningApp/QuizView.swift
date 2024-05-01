//
//  QuizView.swift
//  LanguageLearningApp
//
//  Created by User on 1/5/2024.
// testing github and xcode

import SwiftUI

//This is the page where the gameplay will take place
struct QuizView: View {
    var body: some View {
        VStack{
            HStack{
                //player's name
                Text("Player: Bob").padding(30)
                //display the current question and how many left
                Text("Question: 1/46").padding(30)
            }
            Spacer()
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}

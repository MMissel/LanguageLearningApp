//
//  QuizView.swift
//  LanguageLearningApp
//
//  Created by User on 1/5/2024.
// testing github and xcode

import SwiftUI

//This is the page where the gameplay will take place
struct QuizView: View {
    @State var currentLetter = "Blank"
    @ObservedObject var letterListModel = letterList()

    var body: some View {
        VStack{
            Text("Current Letter: \(currentLetter)")
            HStack{
                //player's name
                Text("Player: Bob").padding(30)
                //display the current question and how many left
                Text("Question: 1/46").padding(30)
            }
            VStack{
                if let currentLetterExists = currentLetter {
                    Image(currentLetterExists)
                }
                Spacer()
                HStack{
                    Text("Option 1").padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    Text("Option 2").padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
                HStack{
                    Text("Option 3").padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    Text("Option 4").padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        ).onTapGesture {
                            letterListModel.isChosenLetterCorrect(chosenLetter: currentLetter, currentLetter: currentLetter)
                        }
                }.padding()
            }.padding(50)
                .onAppear{
                    currentLetter = letterListModel.randomLetter().imageName
                    print("on appear code executed")
                }
            
            Spacer()
            Button("Random Letter"){
                currentLetter = letterListModel.randomLetter().imageName
            }.padding(50)
        }
    }
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}

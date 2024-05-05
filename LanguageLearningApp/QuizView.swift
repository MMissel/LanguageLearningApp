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
    @State var letterOptions: [letter] = []
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
                    Text("\(letterOptions[0].letterName)").padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    Text("\(letterOptions[1].letterName)").padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
                HStack{
                    Text("\(letterOptions[2].letterName)").padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    Text("\(letterOptions[3].letterName)").padding()
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
                    letterListModel.randomLetters()
                    letterOptions = letterListModel.existingLetters
                    print("on appear code executed")
                    print("Element 1 \(letterOptions[0].letterName)")
                    print("Element 2 \(letterOptions[1].letterName)")
                    print("Element 3 \(letterOptions[2].letterName)")
                    print("Element 4 \(letterOptions[3].letterName)")

                }
            
            Spacer()
            Button("Random Letter"){
                currentLetter = letterListModel.randomLetter().imageName
                letterListModel.randomLetters()
                letterOptions = letterListModel.existingLetters
                print("on appear code executed")
                print("Element 1 \(letterOptions[0].letterName)")
                print("Element 2 \(letterOptions[1].letterName)")
                print("Element 3 \(letterOptions[2].letterName)")
                print("Element 4 \(letterOptions[3].letterName)")

            }.padding(50)
        }
    }
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}

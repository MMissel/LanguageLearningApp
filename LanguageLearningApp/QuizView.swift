//
//  QuizView.swift
//  LanguageLearningApp
//
//  Created by User on 1/5/2024.
// testing github and xcode

import SwiftUI



//This is the page where the gameplay will take place
struct QuizView: View {
    
    @State var currentLetter: String?
    //to store the letters which are going to be the options
    @State var letterOptions: [letter] = []
    //letter list of characters grabbed from the letterList class
    @ObservedObject var letterListModel = letterList()
    //Shows the text, correct, incorrect or is blank depending on which answer the user selects
    @State var isChosenCorrect = 1
    //this shows the "Next" button which allows you to move on to the next question
    @State var hasAnswered = false
    //counts which question the player is up to
    @State var questionCounter = 1
    @State var questionCount = 5
    @AppStorage("LETTER_COUNT_KEY") var maxLetterCount: Double = 0
    //allowsus to save score and pass it between pages
    @AppStorage("SCORE_KEY") var quizScore: Int = 0
    //final score
    @AppStorage("FINAL_SCORE_KEY") var finalScore: String = "0/46"
    //create an instance of the viewModel so that we can add the score to the history/leaderboard
    @ObservedObject var viewModel = LeaderBoardViewModel()
    
    var body: some View {
        //when the final question is reached, we will go to the game over page
        if questionCounter == Int(maxLetterCount) + 1 {
            GameOverView()
        } else{
            VStack{
                HStack{
                    //player's name
                    VStack{
                        Text("Player:")
                        Text("Bob")
                    }.padding()
                    VStack{
                        //display the current question and how many left
                        Text("Question:")
                        Text("\(questionCounter)/\(Int(maxLetterCount))")
                    }.padding()
                    VStack{
                        Text("Score:")
                        Text("\(quizScore)")
                    }.padding()
                    
                }
                VStack{
                    if let currentLetterExists = currentLetter {
                        Image(currentLetterExists)
                    }
                    Spacer()
                    switch isChosenCorrect {
                        case 1:
                            Text("")
                                .font(.largeTitle) // Make the text big
                                .foregroundColor(.green) // Make the text green
                        case 2:
                            Text("correct!")
                                .font(.largeTitle) // Make the text big
                                .foregroundColor(.green) // Make the text red
                        case 3:
                            Text("Incorrect :(")
                                .font(.largeTitle) // Make the text big
                                .foregroundColor(.red) // Make the text red
                        default:
                            Text("")
                    }

                    HStack{
                        //letter option 1
                        if !letterOptions.isEmpty {
                            Text("\(letterOptions[0].letterName)").padding()
                                .frame(width: 100, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .onTapGesture {
                                    hasAnswered = true
                                    if letterListModel.defaultLetter.letterName == letterOptions[0].letterName {
                                        isChosenCorrect = 2
                                        quizScore += 1
                                    }else{
                                        isChosenCorrect = 3
                                    }
                                }

                        }else{
                            //these defaults are here initially until the code can run and the proper values appear
                            Text("Default 1").padding()
                                .frame(width: 100, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        }
                        //letter option 2
                        if !letterOptions.isEmpty {
                            Text("\(letterOptions[1].letterName)").padding()
                                .frame(width: 100, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .onTapGesture {
                                    if letterListModel.defaultLetter.letterName == letterOptions[1].letterName {
                                        isChosenCorrect = 2
                                        quizScore += 1
                                    }else{
                                        isChosenCorrect = 3
                                    }
                                    hasAnswered = true
                                }

                        }else{
                            //these defaults are here initially until the code can run and the proper values appear
                            Text("Default 2").padding()
                                .frame(width: 100, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        }
                    }
                    HStack{
                        //letter option 3
                        if !letterOptions.isEmpty {
                            Text("\(letterOptions[2].letterName)").padding()
                                .frame(width: 100, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .onTapGesture {
                                    if letterListModel.defaultLetter.letterName == letterOptions[2].letterName {
                                        isChosenCorrect = 2
                                        quizScore += 1
                                    }else{
                                        isChosenCorrect = 3
                                    }
                                    hasAnswered = true
                                }

                        }else{
                            //these defaults are here initially until the code can run and the proper values appear
                            Text("Default 2").padding()
                                .frame(width: 100, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        }
                        //letter option 4
                        if !letterOptions.isEmpty {
                            Text("\(letterOptions[3].letterName)").padding()
                                .frame(width: 100, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .onTapGesture {
                                    if letterListModel.defaultLetter.letterName == letterOptions[3].letterName {
                                        isChosenCorrect = 2
                                        quizScore += 1
                                    }else{
                                        isChosenCorrect = 3
                                    }
                                    hasAnswered = true
                                }
                        }else{
                            //these defaults are here initially until the code can run and the proper values appear
                            Text("Default 4").padding()
                                .frame(width: 100, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )                    }
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
                if hasAnswered == true {
                    Button("Next"){
                        currentLetter = letterListModel.randomLetter().imageName
                        letterListModel.randomLetters()
                        letterOptions = letterListModel.existingLetters
                        print("on appear code executed")
                        print("Element 1 \(letterOptions[0].letterName)")
                        print("Element 2 \(letterOptions[1].letterName)")
                        print("Element 3 \(letterOptions[2].letterName)")
                        print("Element 4 \(letterOptions[3].letterName)")
                        hasAnswered = false
                        isChosenCorrect = 1
                        questionCounter += 1
                    }.padding(50).font(.system(size: 30))
                }else{
                    Button(action: {}) {
                        Text("Next")
                            .font(.system(size: 30)) // Adjust the size to your preference
                            .foregroundColor(.white)
                    }.padding(50)
                }
             
            }.onDisappear{
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMMM dd, hh:mm a"// Format for month and day only

                let currentDate = Date()
                let dateString = dateFormatter.string(from: currentDate)
                //creating a string that will store the Your score/letter count
                finalScore = "\(quizScore)/\(Int(maxLetterCount))   \(dateString)"
                //calls a function that adds the score and name to the quiz history page
                viewModel.addTuple()
            }

        }
        
            }
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            QuizView()
        }
    }
}

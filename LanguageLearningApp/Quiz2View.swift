//
//  QuizView.swift
//  LanguageLearningApp
//
//  Created by User on 1/5/2024.
// testing github and xcode

import SwiftUI

//quiz 2 functions exactly the same as quiz 1 except it uses a different array.
//other than that it is exactly the same

//This is the page where the gameplay will take place
struct Quiz2View: View {
    
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
        ZStack{
            Color.yellow.opacity(0.29)
            //when the final question is reached, we will go to the game over page
            if questionCounter == Int(maxLetterCount) + 1 {
                GameOverView()
            } else{
                VStack{
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
                    }.padding(50)
                    
                    VStack{
                        
                        if let currentLetterExists = currentLetter {
                            //Text("\(currentLetterExists)")
                            Image(currentLetterExists)
                        }
                        Spacer()
                        switch isChosenCorrect {
                        case 1:
                            Text("")
                                .font(.largeTitle) // Make the text big
                                .foregroundColor(.green) // Make the text green
                        case 2:
                            Text("correct")
                                .font(.largeTitle) // Make the text big
                                .foregroundColor(.green) // Make the text red
                        case 3:
                            Text("Incorrect")
                                .font(.largeTitle) // Make the text big
                                .foregroundColor(.red) // Make the text red
                        default:
                            Text("")
                        }
                        
                        HStack{
                            //letter option 1
                            if !letterOptions.isEmpty {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.brown) // Fill the button with brown color
                                    .frame(width:150, height: 50) // Adjusted frame size
                                    .overlay(
                                        Text("\(letterOptions[0].letterName)").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold() // Set text color to yellow
                                    )
                                    .onTapGesture {
                                        print("Current displayed letter is \(letterListModel.defaultLetter.letterName)")
                                        print("Chosen letter is \(letterOptions[0].letterName)")
                                        print("Are they equal? YES OR NO!")
                                        hasAnswered = true
                                        if currentLetter == letterOptions[0].imageName {
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
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.brown) // Fill the button with brown color
                                    .frame(width:150, height: 50) // Adjusted frame size
                                    .overlay(
                                        Text("\(letterOptions[1].letterName)").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold() // Set text color to yellow
                                    )
                                    .onTapGesture {
                                        print("Current displayed letter is \(letterListModel.defaultLetter.letterName)")
                                        print("Chosen letter is \(letterOptions[1].letterName)")
                                        print("Are they equal? YES OR NO!")
                                        if currentLetter == letterOptions[1].imageName {
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
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.brown) // Fill the button with brown color
                                    .frame(width:150, height: 50) // Adjusted frame size
                                    .overlay(
                                        Text("\(letterOptions[2].letterName)").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold() // Set text color to yellow
                                    )                                        .onTapGesture {
                                        print("Current displayed letter is \(letterListModel.defaultLetter.letterName)")
                                        print("Chosen letter is \(letterOptions[2].letterName)")
                                        print("Are they equal? YES OR NO!")
                                        if currentLetter == letterOptions[2].imageName{
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
                                    .frame(width: 150, height: 50)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                            }
                            //letter option 4
                            if !letterOptions.isEmpty {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.brown) // Fill the button with brown color
                                    .frame(width:150, height: 50) // Adjusted frame size
                                    .overlay(
                                        Text("\(letterOptions[3].letterName)").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold() // Set text color to yellow
                                    )                                    .onTapGesture {
                                        print("Current displayed letter is \(letterListModel.defaultLetter.letterName)")
                                        print("Chosen letter is \(letterOptions[3].letterName)")
                                        print("Are they equal? YES OR NO!")
                                        if currentLetter == letterOptions[3].imageName {
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
                                    .frame(width: 150, height: 50)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 2)
                                    )                    }
                        }.padding()
                    }.padding(50)
                        .onAppear{
                            //gets a random letter form the hiragan alphabet
                            currentLetter = letterListModel.randomLetter2().imageName
                            //generates a random list of letters from the hiragan alphabet
                            letterListModel.randomLetters2()
                            letterOptions = letterListModel.existingLetters
                            print("on appear code executed")
                        }
                    
                    Spacer()
                    if hasAnswered == true {
                        Button(action: {
                            currentLetter = letterListModel.randomLetter2().imageName
                            letterListModel.randomLetters2()
                            letterOptions = letterListModel.existingLetters
                            print("on appear code executed")
                            hasAnswered = false
                            isChosenCorrect = 1
                            questionCounter += 1
                        }) {
                            Text("Next")
                                .foregroundColor(.brown) // Set the text color to brown
                                .font(.system(size: 30)) // Adjust the font size
                        }
                        .padding(60)
                        
                    }else{
                        Button(action: {}) {
                            Text("Next")
                                .font(.system(size: 30)) // Adjust the size to your preference
                                .foregroundColor(.yellow.opacity(0))
                        }.padding(60)
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
            
        }.ignoresSafeArea()
        
    }
}


struct Quiz2View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            Quiz2View()
        }
    }
}

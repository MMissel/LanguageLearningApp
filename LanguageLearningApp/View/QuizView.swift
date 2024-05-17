//
//  QuizView.swift
//  LanguageLearningApp
//
//  Created by User on 1/5/2024.
// testing github and xcode

import SwiftUI



//This is the page where the gameplay will take place
struct QuizView: View {
    //stores the current letter feauted on the screen that players need to guess
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
    //debugging value, delete later
    @State var questionCount = 5
    @AppStorage("LETTER_COUNT_KEY") var maxLetterCount: Double = 0
    //allowsus to save score and pass it between pages
    @AppStorage("SCORE_KEY") var quizScore: Int = 0
    //final score
//    @AppStorage("FINAL_SCORE_KEY") var finalScore: String = "0/46"
    @ObservedObject var viewModel = QuizViewModel()
    //create an instance of the viewModel so that we can add the score to the history/leaderboard
//    @ObservedObject var viewModel = LeaderBoardViewModel()
    @ObservedObject var loginViewModel : LoginViewModel
    var body: some View {

        ZStack{
            //app styling
            Color.yellow.opacity(0.29)
            //when the final question is reached, we will go to the game over page, else we're gonna show the quiz
            if questionCounter == Int(maxLetterCount) + 1 {
                GameOverView(loginViewModel: loginViewModel)
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
                                //display score
                                Text("Score:")
                                Text("\(quizScore)")
                            }.padding()
                            
                        }
                    }.padding(50)
                    
                    VStack{
                        //current letter is the lettter feature don the screen. we take a copy of the value to use and then if it exists, we're gonna display the image of it
                        if let currentLetterExists = currentLetter {
                            //Text("\(currentLetterExists)")
                            Image(currentLetterExists)
                        }
                        Spacer()
                        //if the selected letter is correct or incorrect a message will appear ont he screen
                        switch isChosenCorrect {
                        case 1:
                            Text("")
                                .font(.largeTitle) //make the text big
                                .foregroundColor(.green) //make the text green
                        case 2:
                            Text("correct")
                                .font(.largeTitle) //make the text big
                                .foregroundColor(.green) //make the text red
                        case 3:
                            Text("Incorrect")
                                .font(.largeTitle) //make the text big
                                .foregroundColor(.red) //make the text red
                        default:
                            Text("")
                        }
                        
                        HStack{
                            //letter option 1
                            if !letterOptions.isEmpty {
                                //styyling to make the selections look nice
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.brown) // Fill the button with brown color
                                    .frame(width:150, height: 50) // Adjusted frame size
                                    .overlay(
                                        //get the data to display in the box
                                        Text("\(letterOptions[0].letterName)").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold() // Set text color to yellow
                                    )
                                //executes some code when pressed
                                //will check if the current letter is the same as the selected letter
                                //changes some values to show correct or incorrect as a result of ur answer
                                //adds +1 to the score each time the correct asnwer is selected.
                                //this box and code is repeated 4 more times so no need to comment as the strucuture is complpetely the same
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
                            //when the quiz initially appears we're gonna get a random letter to display on the screen
                            currentLetter = letterListModel.randomLetter().imageName
                            //were generating a random array of 4 letters
                            letterListModel.randomLetters()
                            //bringing that array of random letters to use here in the quiz view
                            letterOptions = letterListModel.existingLetters
                            print("on appear code executed")
                        }
                    
                    Spacer()
                    if hasAnswered == true {
                        Button(action: {
                            //displays a correct or incorrect text based on if the answer is right or wrong
                            currentLetter = letterListModel.randomLetter().imageName
                            //makes random list of letters
                            letterListModel.randomLetters()
                            //bnrings the random list into the page for use
                            letterOptions = letterListModel.existingLetters
                            print("on appear code executed")
                            //resets and adds number to the current questions
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
                        //invisibe to be displayed in themeatnine for apeparance purposes
                        Button(action: {}) {
                            Text("Next")
                                .font(.system(size: 30)) // Adjust the size to your preference
                                .foregroundColor(.yellow.opacity(0))
                        }.padding(60)
                    }
                    //onn disappear we make an entry into a list containing the player name and the score
                }.onDisappear{
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MMMM dd, hh:mm a"// Format for month and day only
                    
                    let currentDate = Date()
                    let dateString = dateFormatter.string(from: currentDate)
                    //creating a string that will store the Your score/letter count
//                    finalScore = "\(quizScore)/\(Int(maxLetterCount))   \(dateString)"
                    viewModel.finalScore = "\(quizScore)/\(Int(maxLetterCount))"
//                    calls a function that adds the score and name to the // Optional binding to safely unwrap userLoggedIn and access name
                   
                    print("this is quiz view \(loginViewModel.userId)")
                    viewModel.addScore(userId: loginViewModel.userId)
                }
                
            }
            
        }.ignoresSafeArea()
        
    }
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            QuizView(loginViewModel: LoginViewModel())
        }
    }
}

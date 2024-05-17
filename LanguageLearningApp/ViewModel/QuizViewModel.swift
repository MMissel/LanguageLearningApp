//
//  QuizViewModel.swift
//  LanguageLearningApp
//
//  Created by Ali Agha Jafari on 16/5/2024.
//

import Foundation
class QuizViewModel: ObservableObject{
    @Published var finalScore : String = "0/45"
    let scoreModel = ScoreViewModel.instance

    func addScore(userId : UUID){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, hh:mm a"// Format for month and day only
        
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
//        print("user logged ins is  \(userEntity)")
        scoreModel.addScore(score: finalScore, date: currentDate, userId: userId)
 
    }
}

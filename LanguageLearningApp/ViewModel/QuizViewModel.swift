//
//  QuizViewModel.swift
//  LanguageLearningApp
//
//  Created by Ali Agha Jafari on 16/5/2024.
//

import Foundation
class QuizViewModel: ObservableObject{
    @Published var finalScore : String = "0/45"
    
    func addScore(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, hh:mm a"// Format for month and day only
        
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
        print(dateString);
        print(finalScore)
    }
}

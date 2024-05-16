//
//  ScoreViewModel.swift
//  LanguageLearningApp
//
//  Created by Ali Agha Jafari on 14/5/2024.
//

import Foundation

import CoreData

class ScoreViewModel: ObservableObject{
    let manager = CoreDataManager.instance
    @Published var scores: [UserScore] = []
//    @ObservedObject var loginViewModel : LoginViewModel
    
    init(){
        
        getScores()
    }
    
    func getScores(){
        let request = NSFetchRequest<UserScore>(entityName: "UserScore")
        do{
            scores = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching scores. \(error.localizedDescription)")
        }
    }
    func addScore(){
        let newScore = UserScore(context: manager.context)
        newScore.score = "0/24"
        save()
        
    }
    
    
    
    func save(){
        scores.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            self.manager.save()
            self.getScores()
        }
    }
    
}

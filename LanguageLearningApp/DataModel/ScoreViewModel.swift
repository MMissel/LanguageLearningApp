//
//  ScoreViewModel.swift
//  LanguageLearningApp
//
//  Created by Ali Agha Jafari on 14/5/2024.
//

import Foundation

import CoreData

class ScoreViewModel: ObservableObject{
    static let instance = ScoreViewModel() //singleton
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
    func addScore(score: String, date: Date, userId: UUID) {
        guard let userEntity = fetchUserEntity(userId: userId) else {
            print("User not found for userID: \(userId)")
            return
        }
        print("this is scoreviewmode \(userEntity.name)")
        
        let newScore = UserScore(context: manager.context)
        newScore.score = score
        newScore.date = date
        
        // Associate the score with the user
        newScore.user = userEntity
        
        save()
        
        print("New score added: \(newScore)")
        print("Associated user: \(userEntity)")
    }
    
    func fetchUserEntity(userId: UUID) -> UserEntity? {
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", userId as CVarArg)
        
        do {
            let users = try manager.context.fetch(fetchRequest)
            return users.first
        } catch {
            print("Error fetching user: \(error)")
            return nil
        }
    }
    
    
    
    func save(){
        scores.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            self.manager.save()
            self.getScores()
        }
    }
    
}

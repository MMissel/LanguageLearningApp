//
//  DataController.swift
//  loginPage
//
//  Created by Ali Agha Jafari on 6/5/2024.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "UsersModel")
    
    init(){
        container.loadPersistentStores{desc, error in
            if let error = error{
                print("Failed to laod the data \(error.localizedDescription)")
            }
        }
    }
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved !!")
        }catch{
            print("We could not save the data")
        }
    }
    
    // add users
    func addUser(name: String, username: String, password: String, context: NSManagedObjectContext){
        let user = User(context: context)
        user.id = UUID()
        user.name = name
        user.username = username
        user.password = password
        user.score = 0
        save(context: context)
    }
    
    func updateScore(user: User, score: Int64, context: NSManagedObjectContext){
        user.score = score
        
        save(context: context)
    }
    
    // Fetch user by username and password
    func fetchUser(username: String, password: String) -> User? {
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
            
            do {
                let users = try container.viewContext.fetch(fetchRequest)
                return users.first
            } catch {
                print("Error fetching user: \(error)")
                return nil
            }
        }
}

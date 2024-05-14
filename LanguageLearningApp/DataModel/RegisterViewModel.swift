//
//  DataController.swift
//  loginPage
//
//  Created by Ali Agha Jafari on 6/5/2024.
//

import Foundation
import CoreData

class RegisterViewModel: ObservableObject{
    
    
    let container = NSPersistentContainer(name: "UserContainer")
    
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
        let userEntity = UserEntity(context: context)
        userEntity.id = UUID()
        userEntity.name = name
        userEntity.username = username
        userEntity.password = password
        save(context: context)
    }
    

    
    // Fetch user by username and password
    func fetchUser(username: String, password: String) -> UserEntity? {
            let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
            
            do {
                let userEntity = try container.viewContext.fetch(fetchRequest)
                return userEntity.first
            } catch {
                print("Error fetching user: \(error)")
                return nil
            }
        }
}

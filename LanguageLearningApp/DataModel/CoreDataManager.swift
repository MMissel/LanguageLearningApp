//
//  CoreDataManager.swift
//  LanguageLearningApp
//
//  Created by Ali Agha Jafari on 14/5/2024.
//

import Foundation
import CoreData
class CoreDataManager{
    static let instance = CoreDataManager() //singleton
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init(){
        container=NSPersistentContainer(name: "UserContainer")
        container.loadPersistentStores{(description, error) in
            if let error = error{
                print("Error loading core Data. \(error)")
            }
        }
        context = container.viewContext

    }
    func save(){
        do{
            try context.save()
        }catch let error{
            print("Error saveing Core Data. \(error.localizedDescription)")
        }
    }
    
    
    
}

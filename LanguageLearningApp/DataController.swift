//
//  DataController.swift
//  LanguageLearningApp
//
//  Created by User on 3/5/2024.
//
//importing core data so we can store stuff in the db and list it in the view
import CoreData
import Foundation

class DataController: ObservableObject {
    //prepares core data to load the letters from the core data database
    let container = NSPersistentContainer(name: "JapaneseLetters")
    //try loading in the data for the letters
    init() {
        print("shit loaded")
        container.loadPersistentStores { description, error in
            //spits out error in case it can't load the data for some reason
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
}

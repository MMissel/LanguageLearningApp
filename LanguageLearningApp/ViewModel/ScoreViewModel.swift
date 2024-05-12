// LeaderBoardViewModel.swift
// This file contains the definition of the LeaderBoardViewModel class, which manages the data and logic related to the leaderboard.
// It is part of the BubblePopGame project and was created by User on 25/4/2024.

import SwiftUI

class LeaderBoardViewModel: ObservableObject {
    //stores the players name and score globally and persistently
    @AppStorage("PLAYER_NAME_KEY") var playerName = "Bobathan"
    @AppStorage("SCORE_KEY") var storedScore = 0
    @AppStorage("FINAL_SCORE_KEY") var finalScore: String = "0/46"
    
    //Tuple of name and score for the leaderboard
    @Published var tuples: [MyTuple] = []
    
    //This key is for the leaderboard data
    let key = "myTuples"
    
    // Init loads the tuples when the page is accessed
    init() {
        loadTuples()
    }
    
    //When game finishes, this is called which adds the score and name to an array for the leaderboard
    func addTuple() {
        // Create a new tuple with the current text and storedScore values
        let newTuple = MyTuple(scoreValue: finalScore, stringValue: playerName)
        
        //appendd the new tuple to the leaderboard array
        tuples.append(newTuple)
        
        //saves the updated leaderboard data to UserDefaults
        saveTuples()
        
       
        
        //For debugging purposes
        print("Adding name \(playerName) and score \(finalScore)")
    }
    
    //this function saves the tuplpes to userdefaults
    private func saveTuples() {
        do {
            //encode the array of tuples into JSON data
            let encodedData = try JSONEncoder().encode(tuples)
            
            //next the encoded data is saved to UserDefaults using our key
            UserDefaults.standard.set(encodedData, forKey: key)
        } catch {
            //error handling
            print("Error encoding tuples: \(error)")
        }
    }
    
    //displays whatever is in the user defaults
    private func loadTuples() {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                //decodes the JSON data into an array of tuples
                tuples = try JSONDecoder().decode([MyTuple].self, from: data)
                
                //again sort the leaderboard entries
            } catch {
                // Handle errors that occur during decoding
                print("Error decoding tuples: \(error)")
            }
        }
    }
}

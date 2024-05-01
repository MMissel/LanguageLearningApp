//
//  ContentView.swift
//  LanguageLearningApp
//
//  Created by User on 30/4/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Japanese Memory App")
            Spacer()
            Text("Play")
            Text("Alphabet")
            Text("Leaderboard")
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
        
    }
}

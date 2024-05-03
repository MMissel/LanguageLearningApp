//
//  AlphabetView.swift
//  LanguageLearningApp
//
//  Created by User on 1/5/2024.
//

import SwiftUI
import CoreData

struct AlphabetView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var letters: FetchedResults<Letter>
    var body: some View {
        VStack {
            Text("AlphabetView")
            List(letters) { letter in
                Text(letter.name ?? "Unknown")
            }
            Button("Add") {
                let letter = Letter(context: moc)
                letter.id = UUID()
                letter.name = "Hello from AlphabetView"
                try? moc.save()
            }
        }
        .padding()
    }
}


struct AlphabetView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetView()
    }
}

//
//  AlphabetView.swift
//  LanguageLearningApp
//
//  Created by User on 1/5/2024.
//

import SwiftUI

struct AlphabetView: View {
    var letters: [letter] = letterList.KatakanaAlphabet
    var body: some View {
        NavigationView{
            List(letters, id: \.id){ letter in
                HStack{Image(letter.imageName).resizable().scaledToFit(
                ).frame(height:70)
                    Text("Letter: \(letter.letterName)").fontWeight(.bold)
                    
                }
                    
            }.navigationTitle("Katakana Alphabet")
        }
           
    }
}

struct AlphabetView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetView()
    }
}

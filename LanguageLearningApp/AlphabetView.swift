//
//  AlphabetView.swift
//  LanguageLearningApp
//
//  Created by User on 1/5/2024.
//

import SwiftUI
import CoreData

struct AlphabetView: View {
    var letters: [letter] = letterList.KatakanaAlphabet
    var body: some View {
        VStack{
            Text("Letter list")
                .font(.system(size: 30))
            List(letters) { letter in
                HStack{
                    Text("\(letter.letterName)")
                        .font(.system(size: 80))
                    Spacer()
                    Image(letter.imageName)
                    
                }
                
            }
        }
        //  NavigationView{
        //    List(letters2, id: \.id){ letter in
        //    HStack{Image(letter.imageName ?? "a").resizable().scaledToFit(
        //    ).frame(height:70)
        //       Text("Letter: \(letter.letterName ?? "Unknown")").fontWeight(.bold)
        //
        //   }
        //
        // }.navigationTitle("Katakana Alphabet")
    }
    
}


struct AlphabetView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetView()
    }
}

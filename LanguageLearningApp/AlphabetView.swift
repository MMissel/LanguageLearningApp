//
//  AlphabetView.swift
//  LanguageLearningApp
//
//  Created by User on 1/5/2024.
//

import SwiftUI
import CoreData

struct AlphabetView: View {
    @ObservedObject var letterListModel = letterList()
    var body: some View {
        VStack{
            Text("Letter list")
                .font(.system(size: 30))
            List(letterList.KatakanaAlphabet) { letter in
                HStack{
                    Text("\(letter.letterName)")
                        .font(.system(size: 80))
                    Spacer()
                    Image(letter.imageName)
                }
            }
        }
    }
    
}


struct AlphabetView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetView()
    }
}

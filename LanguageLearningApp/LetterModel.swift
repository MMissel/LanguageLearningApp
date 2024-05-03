//
//  LetterModel.swift
//  LanguageLearningApp
//
//  Created by User on 1/5/2024.
//

import Foundation

//this file contains the japanese letters for the Japanese alphabet called "Katakana"

struct letter: Identifiable {
    let id = UUID()
    let imageName: String
    let letterName: String
}

//this is a list of the letters
//we will need to store this list in a core data database
struct letterList {
    static let KatakanaAlphabet = [letter(imageName: "icons8-katakana-a-100", letterName: "a"),
                                   letter(imageName: "icons8-katakana-e-100", letterName: "e"),
                                   letter(imageName: "icons8-katakana-u-100", letterName: "u"),
                                   letter(imageName: "icons8-katakana-i-100", letterName: "i"),
                                   letter(imageName: "icons8-katakana-a-100", letterName: "o")]
}

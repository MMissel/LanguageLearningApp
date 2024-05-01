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
    static let KatakanaAlphabet = [letter(imageName: "a", letterName: "a"),
                                   letter(imageName: "e", letterName: "e"),
                                   letter(imageName: "u", letterName: "u"),
                                   letter(imageName: "i", letterName: "i"),
                                   letter(imageName: "o", letterName: "o")]
}

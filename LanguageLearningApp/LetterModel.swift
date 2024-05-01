//
//  LetterModel.swift
//  LanguageLearningApp
//
//  Created by User on 1/5/2024.
//

import Foundation

//this file contains the japanese letters for the Japanese alphabet called "Katakana"

struct letter {
    let imageName: String
    let letterName: String
}

//this is a list of the letters
struct letterList {
    static let KatakanaAlphabet = [letter(imageName: "a.png", letterName: "a"),
                                   letter(imageName: "e.png", letterName: "e"),
                                   letter(imageName: "u.png", letterName: "u"),
                                   letter(imageName: "i.png", letterName: "i"),
                                   letter(imageName: "o.png", letterName: "o")]
}

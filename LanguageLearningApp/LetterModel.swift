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
class letterList: ObservableObject {
    //a default letter that is initialised first
    @Published var defaultLetter = letter(imageName: "icons8-katakana-a-100", letterName: "a")
    //this array stores 4 letters
    //these letters are displayed as the options in the quiz
    @Published var existingLetters: [letter] = []
    //keeps the score
    
    
    static let KatakanaAlphabet = [
        letter(imageName: "icons8-katakana-a-100", letterName: "a"),
        letter(imageName: "icons8-katakana-e-100", letterName: "e"),
        letter(imageName: "icons8-katakana-u-100", letterName: "u"),
        letter(imageName: "icons8-katakana-i-100", letterName: "i"),
        letter(imageName: "icons8-katakana-o-100", letterName: "o"),
        letter(imageName: "icons8-katakana-ka-100", letterName: "ka"),
        letter(imageName: "icons8-katakana-ki-100", letterName: "ki"),
        letter(imageName: "icons8-katakana-ku-100", letterName: "ku"),
        letter(imageName: "icons8-katakana-ke-100", letterName: "ke"),
        letter(imageName: "icons8-katakana-ko-100", letterName: "ko"),
        letter(imageName: "icons8-katakana-sa-100", letterName: "sa"),
        letter(imageName: "icons8-katakana-shi-100", letterName: "shi"),
        letter(imageName: "icons8-katakana-su-100", letterName: "su"),
        letter(imageName: "icons8-katakana-se-100", letterName: "se"),
        letter(imageName: "icons8-katakana-so-100", letterName: "so"),
        letter(imageName: "icons8-katakana-ta-100", letterName: "ta"),
        letter(imageName: "icons8-katakana-chi-100", letterName: "chi"),
        letter(imageName: "icons8-katakana-tsu-100", letterName: "tsu"),
        letter(imageName: "icons8-katakana-te-100", letterName: "te"),
        letter(imageName: "icons8-katakana-to-100", letterName: "to"),
        letter(imageName: "icons8-katakana-na-100", letterName: "na"),
        letter(imageName: "icons8-katakana-ni-100", letterName: "ni"),
        letter(imageName: "icons8-katakana-nu-100", letterName: "nu"),
        letter(imageName: "icons8-katakana-ne-100", letterName: "ne"),
        letter(imageName: "icons8-katakana-no-100", letterName: "no"),
        letter(imageName: "icons8-katakana-ha-100", letterName: "ha"),
        letter(imageName: "icons8-katakana-hi-100", letterName: "hi"),
        letter(imageName: "icons8-katakana-fu-100", letterName: "fu"),
        letter(imageName: "icons8-katakana-he-100", letterName: "he"),
        letter(imageName: "icons8-katakana-ho-100", letterName: "ho"),
        letter(imageName: "icons8-katakana-ma-100", letterName: "ma"),
        letter(imageName: "icons8-katakana-mi-100", letterName: "mi"),
        letter(imageName: "icons8-katakana-mu-100", letterName: "mu"),
        letter(imageName: "icons8-katakana-me-100", letterName: "me"),
        letter(imageName: "icons8-katakana-mo-100", letterName: "mo"),
        letter(imageName: "icons8-katakana-ya-100", letterName: "ya"),
        letter(imageName: "icons8-katakana-yu-100", letterName: "yu"),
        letter(imageName: "icons8-katakana-yo-100", letterName: "yo"),
        letter(imageName: "icons8-katakana-ra-100", letterName: "ra"),
        letter(imageName: "icons8-katakana-ri-100", letterName: "ri"),
        letter(imageName: "icons8-katakana-ru-100", letterName: "ru"),
        letter(imageName: "icons8-katakana-re-100", letterName: "re"),
        letter(imageName: "icons8-katakana-ro-100", letterName: "ro"),
        letter(imageName: "icons8-katakana-wa-100", letterName: "wa"),
        letter(imageName: "icons8-katakana-wo-100", letterName: "wo"),
        letter(imageName: "icons8-katakana-n-100", letterName: "n")
        
    ]
    
    static let hiraganaAlphabet = [
        letter(imageName: "icons8-hiragana-a-100", letterName: "a"),
        letter(imageName: "icons8-hiragana-e-100", letterName: "e"),
        letter(imageName: "icons8-hiragana-u-100", letterName: "u"),
        letter(imageName: "icons8-hiragana-i-100", letterName: "i"),
        letter(imageName: "icons8-hiragana-o-100", letterName: "o"),
        letter(imageName: "icons8-hiragana-ka-100", letterName: "ka"),
        letter(imageName: "icons8-hiragana-ki-100", letterName: "ki"),
        letter(imageName: "icons8-hiragana-ku-100", letterName: "ku"),
        letter(imageName: "icons8-hiragana-ke-100", letterName: "ke"),
        letter(imageName: "icons8-hiragana-ko-100", letterName: "ko"),
        letter(imageName: "icons8-hiragana-sa-100", letterName: "sa"),
        letter(imageName: "icons8-hiragana-shi-100", letterName: "shi"),
        letter(imageName: "icons8-hiragana-su-100", letterName: "su"),
        letter(imageName: "icons8-hiragana-se-100", letterName: "se"),
        letter(imageName: "icons8-hiragana-so-100", letterName: "so"),
        letter(imageName: "icons8-hiragana-ta-100", letterName: "ta"),
        letter(imageName: "icons8-hiragana-chi-100", letterName: "chi"),
        letter(imageName: "icons8-hiragana-tsu-100", letterName: "tsu"),
        letter(imageName: "icons8-hiragana-te-100", letterName: "te"),
        letter(imageName: "icons8-hiragana-to-100", letterName: "to"),
        letter(imageName: "icons8-hiragana-na-100", letterName: "na"),
        letter(imageName: "icons8-hiragana-ni-100", letterName: "ni"),
        letter(imageName: "icons8-hiragana-nu-100", letterName: "nu"),
        letter(imageName: "icons8-hiragana-ne-100", letterName: "ne"),
        letter(imageName: "icons8-hiragana-no-100", letterName: "no"),
        letter(imageName: "icons8-hiragana-ha-100", letterName: "ha"),
        letter(imageName: "icons8-hiragana-hi-100", letterName: "hi"),
        letter(imageName: "icons8-hiragana-fu-100", letterName: "fu"),
        letter(imageName: "icons8-hiragana-he-100", letterName: "he"),
        letter(imageName: "icons8-hiragana-ho-100", letterName: "ho"),
        letter(imageName: "icons8-hiragana-ma-100", letterName: "ma"),
        letter(imageName: "icons8-hiragana-mi-100", letterName: "mi"),
        letter(imageName: "icons8-hiragana-mu-100", letterName: "mu"),
        letter(imageName: "icons8-hiragana-me-100", letterName: "me"),
        letter(imageName: "icons8-hiragana-mo-100", letterName: "mo"),
        letter(imageName: "icons8-hiragana-ya-100", letterName: "ya"),
        letter(imageName: "icons8-hiragana-yu-100", letterName: "yu"),
        letter(imageName: "icons8-hiragana-yo-100", letterName: "yo"),
        letter(imageName: "icons8-hiragana-ra-100", letterName: "ra"),
        letter(imageName: "icons8-hiragana-ri-100", letterName: "ri"),
        letter(imageName: "icons8-hiragana-ru-100", letterName: "ru"),
        letter(imageName: "icons8-hiragana-re-100", letterName: "re"),
        letter(imageName: "icons8-hiragana-ro-100", letterName: "ro"),
        letter(imageName: "icons8-hiragana-wa-100", letterName: "wa"),
        letter(imageName: "icons8-hiragana-wo-100", letterName: "wo"),
        letter(imageName: "icons8-hiragana-n-100", letterName: "n")
    ]


    //generates a random letter to be displayed on the quiz
    func randomLetter() -> letter {
        if let newLetter = letterList.KatakanaAlphabet.randomElement(){
            defaultLetter = newLetter
        }
        print("New letter displayed on the screen is \(defaultLetter.letterName)")
        return defaultLetter
    }
    
//    func isChosenLetterCorrect(chosenLetter: String, currentLetter: String) -> Bool {
//        //compare the chosen letter with some condition and return true or false accordingly
//        if chosenLetter == currentLetter{
//            print ("Chosen passed through letter is: \(chosenLetter)")
//        }else {
//            print("Incorrect")
//            return false
//        }
//        return true
//    }
    //generates random letters to show as the potential options in the quiz
    func randomLetters(){
        //temporary array to store the random letters
        var randomLetters: [letter] = []
        for _ in 0..<3 { //generate three random letters
            if let randomLetter = letterList.KatakanaAlphabet.randomElement() {
                print("appended \(randomLetter.letterName)")
                randomLetters.append(randomLetter)
            }
        }
        existingLetters.removeAll()
        existingLetters += randomLetters //append the randomly generated letters to the existing array
        //add the correct letter answer
        print("Adding letter \(defaultLetter.letterName)")
        existingLetters.append(defaultLetter)
        existingLetters.shuffle()
    }
    
//    func isChosenCorrect(chosenLetter: String) -> Bool{
//        print("current letter is \(defaultLetter.letterName)")
//        print("chosen letter is \(chosenLetter)")
//        if chosenLetter == defaultLetter.letterName{
//                        print("isChosenCorrect returned true")
//            return true
//        }else {
//            print("isChosenCorrect returned false")
//            return false
//        }
//    }
    func randomLetter2() -> letter {
        if let newLetter = letterList.hiraganaAlphabet.randomElement(){
            defaultLetter = newLetter
        }
        print("New letter displayed on the screen is \(defaultLetter.letterName)")
        return defaultLetter
    }
    func randomLetters2(){
        //temporary array to store the random letters
        var randomLetters: [letter] = []
        for _ in 0..<3 { //generate three random letters
            if let randomLetter = letterList.hiraganaAlphabet.randomElement() {
                randomLetters.append(randomLetter)
            }
        }
        existingLetters.removeAll()
        existingLetters += randomLetters //append the randomly generated letters to the existing array
        //add the correct letter answer
        print("Adding letter \(defaultLetter.letterName)")
        existingLetters.append(defaultLetter)
        existingLetters.shuffle()
    }
    
}



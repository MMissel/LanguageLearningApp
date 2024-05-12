import SwiftUI
import CoreData

struct AlphabetView: View {
    //gets the array from the letterlist model by first instantaiting the class
    //then later we grab the array
    @ObservedObject var letterListModel = letterList()
    
    var body: some View {
        VStack{
            Text("KATAKANA").foregroundColor(.brown).bold()
                .font(.title)
            //display the array from letterlistmodel
            List(letterList.KatakanaAlphabet) { letter in
                HStack{
                    Text("\(letter.letterName)")
                        .font(.system(size: 80)).foregroundColor(.brown).bold()
                    Spacer()
                    Image(letter.imageName)
                }
                .listRowBackground(Color.yellow.opacity(0.29)) // Set list row background color
            }
        }
        .background(Color.yellow.opacity(0.29)) // Set overall background color
    }
}

struct AlphabetView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetView()
    }
}

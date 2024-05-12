import SwiftUI
import CoreData

struct Alphabet2View: View {
    //creates instance of letterlist() to take its data for use
    @ObservedObject var letterListModel = letterList()
    
    var body: some View {
        VStack{
            Text("HIRAGANA").foregroundColor(.brown).bold()
                .font(.title)
            //displayes the hiragana alphabet
            List(letterList.hiraganaAlphabet) { letter in
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

struct Alphabet2View_Previews: PreviewProvider {
    static var previews: some View {
        Alphabet2View()
    }
}

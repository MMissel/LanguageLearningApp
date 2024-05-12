import SwiftUI

struct AlphabetTabView: View {
    //alphabet tab view is simply a view that allows u to select wehether u wanna view katakan alphabet or hiragan alphabet
    var body: some View {
        TabView {
            AlphabetView().tabItem {
                Text("Katakana")
                    .foregroundColor(.black) // Set text color to blue
                    .font(.headline) // Set text size to headline
            }
            Alphabet2View()
                .tabItem {
                    Text("Hiragana")
                }
        }.accentColor(.brown)
    }
}

struct AlphabetTabView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetTabView()
    }
}

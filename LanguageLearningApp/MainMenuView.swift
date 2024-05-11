import SwiftUI

struct MainMenuView: View {
    var body: some View {
        ZStack{
            Color.yellow.opacity(0.29)
            VStack(spacing: 20) { // Added spacing between views
                Text("KATAKANA MEMORY ASSISTANT ").font(.largeTitle).foregroundColor(.brown).bold()
                Image("ralph2")
                    .resizable() // Make the image resizable
                    .aspectRatio(contentMode: .fit) // Maintain aspect ratio while fitting the content
                    .frame(width: 200, height: 200) // Set the desired frame size
                NavigationLink(destination: SettingsTabView()){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.brown.opacity(0.6)) // Fill the button with brown color
                        .frame(width: 200, height: 60) // Adjusted frame size
                        .overlay(
                            Text("Quiz").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold() // Set text color to yellow
                        )
                }
                NavigationLink(destination: AlphabetTabView()){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.brown.opacity(0.6)) // Fill the button with brown color
                        .frame(width: 200, height: 60) // Adjusted frame size
                        .overlay(
                            Text("ALPHABET").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold() // Set text color to yellow
                        )
                }
                NavigationLink(destination: ScoreView()){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.brown.opacity(0.6)) // Fill the button with brown color
                        .frame(width: 200, height: 60) // Adjusted frame size
                        .overlay(
                            Text("HISTORY").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold() // Set text color to yellow
                        )
                }
                Spacer()
            }
            .padding(80)
        }.ignoresSafeArea(.all)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainMenuView()
        }
    }
}

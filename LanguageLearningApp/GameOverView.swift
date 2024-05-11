import SwiftUI

struct GameOverView: View {
    @AppStorage("LETTER_COUNT_KEY") var maxLetterCount: Double = 0
    @AppStorage("SCORE_KEY") var quizScore: Int = 0
    var body: some View {
        ZStack{
            Color.yellow.opacity(0.29)
            VStack{
                Text("Game Over")
                    .font(.largeTitle).foregroundColor(.brown).bold()

                    .padding(.top, 80)
                Text("Score: \(quizScore)/\(Int(maxLetterCount))").padding().font(.largeTitle).foregroundColor(.brown).bold()

                Spacer()
                NavigationLink(destination: SettingsView().navigationBarBackButtonHidden(true)){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.brown.opacity(0.6)) // Fill the button with brown color
                        .frame(width: 200, height: 60) // Adjusted frame size
                        .overlay(
                            Text("TRY AGAIN").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold() // Set text color to yellow
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

                NavigationLink(destination: MainMenuView().navigationBarBackButtonHidden(true)){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.brown.opacity(0.6)) // Fill the button with brown color
                        .frame(width: 200, height: 60) // Adjusted frame size
                        .overlay(
                            Text("HOME").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold() // Set text color to yellow
                        )
                }
                

                Spacer()
            }
        }.ignoresSafeArea()
        
    }
    
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            GameOverView()
        }
    }
}

import SwiftUI

struct GameOverView: View {
    var body: some View {
        VStack{
            Text("Game Over")
                .font(.largeTitle)
                .padding(.top, 50)
            Text("Score: 1/46").padding()
            Spacer()
            NavigationLink(destination: SettingsView()){
                Text("Play Again").padding()
                    .frame(width: 210, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                    )
            }
            NavigationLink(destination: MainMenuView().navigationBarBackButtonHidden(true)){
                Text("Main Menu").padding()
                    .frame(width: 210, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                    )
            }
            

            Spacer()
        }
    }
    
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            GameOverView()
        }
    }
}

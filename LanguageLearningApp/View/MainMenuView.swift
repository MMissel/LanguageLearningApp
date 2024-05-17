import SwiftUI

struct MainMenuView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    var body: some View {
        
        if(!loginViewModel.isLoggedIn){
            LoginView( loginViewModel: loginViewModel)
        }else{
            ZStack{
                //gives the app its theme
    
                Color.yellow.opacity(0.29)
                VStack(spacing: 20) { //added spacing between views
                    Text("JAPANESE MEMORY ASSISTANT ").font(.largeTitle).foregroundColor(.brown).bold()
                    Image("ralph2")
                        .resizable() //make the image resizable
                        .aspectRatio(contentMode: .fit) //mainntain aspect ratio while fitting the content
                        .frame(width: 200, height: 200) // Set the desired frame size
                    //each navigation link takes u to the respective page
                    NavigationLink(destination: SettingsTabView(loginvm: loginViewModel)){
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.brown.opacity(0.6)) //fill the button with brown color
                            .frame(width: 200, height: 60) //adjusted frame size
                            .overlay(
                                Text("Quiz").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold()//set text color to yellow
                            )
                    }
                    NavigationLink(destination: AlphabetTabView()){
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.brown.opacity(0.6)) //fll the button with brown color
                            .frame(width: 200, height: 60) //adjusted frame size
                            .overlay(
                                Text("ALPHABET").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold() //set text color to yellow
                            )
                    }
                    //takes u to quiz history page
                    NavigationLink(destination: ScoreView( loginViewModel: loginViewModel)){
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.brown.opacity(0.6)) //fill the button with brown color
                            .frame(width: 200, height: 60) //ajusted frame size
                            .overlay(
                                Text("HISTORY").padding().foregroundColor(.black.opacity(0.6)).font(.system(size: 26)).bold() //set text color to yellow
                            )
                    }
                    Spacer()
                }
                .padding(80)
            }.ignoresSafeArea(.all)
        }
    }
        
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainMenuView(loginViewModel: LoginViewModel())
        }
    }
}

import SwiftUI

struct SettingsTabView: View {
    //tab view lets u choose between the 2 quiz alphabet settings
    @ObservedObject var loginvm : LoginViewModel
    var body: some View {
    
        TabView {
            SettingsView( loginvm: loginvm).tabItem {
                Image(systemName: "number-one")
                Text("Katakana")
                    .foregroundColor(.black) // Set text color to blue
                    .font(.headline) // Set text size to headline
            }
            Settings2View(loginvm: loginvm)
                .tabItem {
                    Image(systemName: "number-one")
                    Text("Hiragana")
                  
                }
        }.accentColor(.brown).onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView(loginvm: LoginViewModel())
    }
}

import SwiftUI

// Define a Codable struct to represent the tuple
struct MyTuple: Codable {
    let scoreValue: String
    let stringValue: String
}
//the score view page is more of a quiz history page, it grabs the data from the LeaderBoardViewModel and displays the history in descending order by date and time

    
struct ScoreView: View {
    //create an instance of the leadrboardviewmodel to use
//    @ObservedObject var viewModel = LeaderBoardViewModel()
    @ObservedObject var scoreViewModel = ScoreViewModel()
    @ObservedObject var loginViewModel: LoginViewModel
    // DateFormatter to format the date
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, hh:mm a"
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("Quiz History")
                .padding(70)
                .foregroundColor(.brown)
                .bold()
                .font(.title)
            
            List(scoreViewModel.scores, id: \.self) { score in
                if score.user?.id == loginViewModel.userId { // Check if score is related to the logged-in user
                    VStack {
                        HStack{
                            Text("Score: \(score.score ?? "")")
                                .foregroundColor(.brown)
                                .bold()
                            Spacer()
                            // Display the formatted date
                            Text("\(score.date.map { dateFormatter.string(from: $0) } ?? "")")
                                .foregroundColor(.brown)
                                .bold()
                        }
                        
                    }
                    .listRowBackground(Color.yellow.opacity(0.29))

                }
            }
            
        }
        .background(Color.yellow.opacity(0.29)) // Set overall background color
        .edgesIgnoringSafeArea(.all) // Ignore safe area to fill the entire screen
    }
}


struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ScoreView(loginViewModel: LoginViewModel())
        }
    }
}

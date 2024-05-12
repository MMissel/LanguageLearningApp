import SwiftUI

// Define a Codable struct to represent the tuple
struct MyTuple: Codable {
    let scoreValue: String
    let stringValue: String
}
//the score view page is more of a quiz history page, it grabs the data from the LeaderBoardViewModel and displays the history in descending order by date and time
struct ScoreView: View {
    //create an instance of the leadrboardviewmodel to use
    @ObservedObject var viewModel = LeaderBoardViewModel()
    
    var body: some View {
        VStack {
            Text("Quiz History")
                .padding(70)
                .foregroundColor(.brown)
                .bold()
                .font(.title)
            //displpays the list of tuples from user defaults that stores the name and the score
            List(viewModel.tuples.reversed(), id: \.scoreValue) { tuple in // Reversing the list here
                VStack {
                    Text("\(tuple.stringValue) - \(tuple.scoreValue)")
                        .foregroundColor(.brown)
                        .bold()
                }
                .listRowBackground(Color.yellow.opacity(0.29))
            }
            .background(Color.yellow.opacity(0.29))
            .padding()
        }
        .background(Color.yellow.opacity(0.29)) // Set overall background color
        .edgesIgnoringSafeArea(.all) // Ignore safe area to fill the entire screen
    }
}


struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ScoreView()
        }
    }
}

import SwiftUI

// Define a Codable struct to represent the tuple
struct MyTuple: Codable {
    let scoreValue: String
    let stringValue: String
}

struct ScoreView: View {
    @ObservedObject var viewModel = LeaderBoardViewModel()
    
    var body: some View {
        VStack {
            Text("Quiz History").padding(70).foregroundColor(.brown).bold()
                .font(.title)
            
            List(viewModel.tuples, id: \.scoreValue) { tuple in
                VStack{
                    Text("\(tuple.stringValue) - \(tuple.scoreValue)")
                        .foregroundColor(.brown).bold()

                }
                .listRowBackground(Color.yellow.opacity(0.29))
            }.background(Color.yellow.opacity(0.29))
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

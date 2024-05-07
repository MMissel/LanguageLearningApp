import SwiftUI
//sorry for the messy code
//define a Codable struct to represent the tuple
struct MyTuple: Codable {
    let scoreValue: String
    let stringValue: String
    
}

struct ScoreView: View {
    @ObservedObject var viewModel = LeaderBoardViewModel()
    
    var body: some View {
        VStack {
            Text("Quiz History").font(.title).foregroundColor(.red)
            List(viewModel.tuples, id: \.scoreValue) { tuple in
                VStack{
                    Text("\(tuple.stringValue) - \(tuple.scoreValue)").foregroundColor(.red)
                }
                
            }
            .padding()
        }
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ScoreView()
        }
    }
}

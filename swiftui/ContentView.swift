import SwiftUI

struct ContentView: View {
    
    var videos: [Video] = VideoList.topFive
    
    var body: some View {
        NavigationView {
            List(videos) { video in
                NavigationLink(destination: Text("Details for \(video.title)")) {
                    HStack {
                        Image(video.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 90.0)
                            .cornerRadius(8)
                        
                        Spacer().frame(width: 16)
                        
                        VStack(alignment: .leading) {
                            Text(video.title)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .foregroundColor(.red)
                            
                            Text(video.uploadDate)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitle(Text("One Piece"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() 
    }
}


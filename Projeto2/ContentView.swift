

import SwiftUI

var Song = [ 
    SongI(id: 1,
          name: "polly" ,
          artist: "Nirvana",
          capa: "https://upload.wikimedia.org/wikipedia/pt/3/3f/Nevermind.jpg"),
    SongI(id: 1,
          name: "stay Away" ,
          artist: "Nirvana",
          capa: "https://upload.wikimedia.org/wikipedia/pt/3/3f/Nevermind.jpg"),
    SongI(id: 1,
          name: "rehab" ,
          artist: "amy winehouse",
          capa: "https://upload.wikimedia.org/wikipedia/pt/9/93/Capa_de_Back_to_Black.jpg"),
    SongI(id: 1,
          name: "wake up alone" ,
          artist: "amy winehouse",
          capa: "https://upload.wikimedia.org/wikipedia/pt/9/93/Capa_de_Back_to_Black.jpg"),
]

var Suggestions = [
    SuggestionsI(id: 01,
                 albumName: "frank",
                 capaAlbum: "https://upload.wikimedia.org/wikipedia/pt/b/b2/Frank.jpeg"),
    SuggestionsI(id: 02,
                 albumName: "you sent me flying",
                 capaAlbum: "https://upload.wikimedia.org/wikipedia/pt/b/b2/Frank.jpeg"),
    SuggestionsI(id: 03,
                 albumName: "fuck me pumps",
                 capaAlbum: "https://upload.wikimedia.org/wikipedia/pt/b/b2/Frank.jpeg"),
    SuggestionsI(id: 04,
                 albumName: "take the box",
                 capaAlbum: "https://upload.wikimedia.org/wikipedia/pt/b/b2/Frank.jpeg"),
    SuggestionsI(id: 05,
                 albumName: "help yourself",
                 capaAlbum: "https://upload.wikimedia.org/wikipedia/pt/b/b2/Frank.jpeg"),
]


let coloredNavAppearance = UINavigationBarAppearance()

struct ContentView: View {
    @State private var searchText = ""
    
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .systemBlue
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.blue]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }

    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom
                )
                VStack{
                    TelaUm(songFiltered: searchText )
                }
            }
        }
        .navigationBarTitle("NavBar Title")
        .tint(.white)
        .searchable(text: $searchText) 
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

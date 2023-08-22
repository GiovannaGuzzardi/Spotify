import SwiftUI

struct TelaUm: View {
    var songFiltered : String
    
    var searchResults: [SongI] {
             if songFiltered.isEmpty {
                 return Song
             } else {
                 return Song.filter { $0.name.contains(songFiltered.lowercased()) }
             }
    }
    
    var body: some View {
            ScrollView {
                VStack(spacing: 10 ){
                    Spacer()
                        AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/pt/3/3f/Nevermind.jpg")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .padding(10)
                        .frame(width: 200, height: 200)
                    VStack(alignment: .leading) {
                        Text("Playlist só Perolas")
                            .font(.title)
                            .foregroundColor(.white)
                        HStack{
                            AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/pt/3/3f/Nevermind.jpg")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 30, height: 30)
                            .padding()
                            Text("HackaSong")
                                .foregroundColor(.gray)
                        }
                        if searchResults.isEmpty {
                            HStack{
                                Spacer()
                                Text("Faixa não encontrada")
                                    .font(.title)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        } else {
                            ForEach((0..<searchResults.count), id: \.self) {
                                value in
                                NavigationLink(destination : TelaDois(choise: searchResults[value])) {
                                    HStack(spacing: 10){
                                        AsyncImage(url: URL(string: searchResults[value].capa)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 40, height: 40)
                                        VStack(alignment: .leading){
                                            Text("\(searchResults[value].name)").font(.title3)
                                                .foregroundColor(.white)
                                            Text("\(searchResults[value].artist)").foregroundColor(.gray)
                                        }
                                        Spacer()
                                        Image(systemName: "ellipsis")
                                    }.ignoresSafeArea()
                                }
                            }
                        }
                    }
                    Spacer()
                    Text("Sugeridos").font(.title).foregroundColor(.white)
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(0..<Suggestions.count, id: \.self) {
                                value in
                                VStack{
                                    AsyncImage(url: URL(string: "\(Suggestions[value].capaAlbum)")) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 150, height: 150)
                                    Text("\(value + 1) - \(Suggestions[value].albumName)") .font(.headline).foregroundColor(.white)
                                    
                                }
                            }
                        }
                    }
                }.padding()
                
            }
       
    }
}

struct TelaUm_Previews: PreviewProvider {
    static var previews: some View {
        TelaUm(songFiltered : "")
    }
}

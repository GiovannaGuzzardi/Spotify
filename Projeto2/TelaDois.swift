import SwiftUI

struct TelaDois: View {
    var choise : SongI
    var body: some View {
        ZStack(){
            LinearGradient(
                gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom
            )
            VStack{
                AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/pt/3/3f/Nevermind.jpg")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .padding()
                Text(choise.name)
                    .font(.title)
                    .foregroundColor(.white)
                Text(choise.artist)
                    .font(.title2)
                    .foregroundColor(.gray)
                HStack(spacing: 30){
                    Image(systemName: "shuffle")
                    Image(systemName: "backward.end.fill")
                    Image(systemName: "play.fill")
                    Image(systemName: "forward.end.fill")
                    Image(systemName: "repeat")
                }.padding()
                    .font(.title)
                    .foregroundColor(.white)
            }
            
        }.ignoresSafeArea()
        
    }
}


// eu coloco o choise como se foesse um exemplo de argumento que ele pode receber
struct TelaDois_Previews: PreviewProvider {
    static var previews: some View {
        TelaDois(choise: SongI(id: 1,
                               name: "polly" ,
                               artist: "Nirvana",
                               capa: "https://upload.wikimedia.org/wikipedia/pt/3/3f/Nevermind.jpg"))
    }
}

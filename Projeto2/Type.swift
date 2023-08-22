import Foundation

struct SuggestionsI : Identifiable {
    var id : Int
    var albumName : String
    var capaAlbum : String
}

struct SongI : Identifiable {
    var id : Int
    var name : String
    var artist : String
    var capa : String
}

//var choise : SongI?

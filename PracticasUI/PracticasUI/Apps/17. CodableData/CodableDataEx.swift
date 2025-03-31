//
//  CodableData.swift
//  PracticasUI
//
//  Created by Ares Armesto, Yago on 31/3/25.
//


struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


import SwiftUI

struct CodableDataEx: View {
    @State private var results = [Result]()
    var body: some View {
        List(results, id: \.trackId){ item in
            VStack(alignment: .leading){
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            //Como es asíncrona, espero a que se ejeucte la función antes de mostra la lista
            await loadData()
        }
    }

    func loadData() async {
        //Leo la URL
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            //Decodificamos la URL y lo mostramos en una matriz
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }

        } catch {
            print("Invalid data")
        }
    }
}



#Preview {
    CodableDataEx()
}

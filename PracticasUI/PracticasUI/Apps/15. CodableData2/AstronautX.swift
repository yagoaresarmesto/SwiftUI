import Foundation

struct AstronautX: Codable, Identifiable { //Codable para que podamos crear instancias de la esctrucutra directamente desde JSON, y Indenfiable para que podemaos usar arrays de astronautas dentro del ForEach
    let id: String
    let name: String
    let description: String
}

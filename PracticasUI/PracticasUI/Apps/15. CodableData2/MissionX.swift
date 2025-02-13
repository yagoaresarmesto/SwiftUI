import Foundation

struct MissionX: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
        
    }
    
    let id: Int
    let launchDate: Date? //Optional porque en el json a veces no viene
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "NA"
    }
}

//Esto se denomina estructura anidada y es simplemente una estructura colocada dentro de otra. Esto no afectará nuestro código en este proyecto, pero en otros lugares es útil para ayudar a mantener el código organizado: en lugar de decir CrewRoleque escribirías Mission.CrewRole. 

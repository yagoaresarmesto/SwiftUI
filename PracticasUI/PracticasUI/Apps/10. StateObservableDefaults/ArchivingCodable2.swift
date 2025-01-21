import SwiftUI

struct User3: Codable {
    let firstName: String
    let lastName: String
}

struct ArchivingCodable2: View {
    @State private var user = User3(firstName: "Yago", lastName: "Ares")
    var body: some View {
        Button("Save User"){
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user){
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        
        }
    }
}

#Preview {
    ArchivingCodable2()
}

import SwiftUI

struct User4: Codable {
    let name : String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}


struct CodableDataExample: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
     {
        "name": "Yago Ares",
        "address": {
            "street": "555, Bispo Avenue",
            "city": "Lugo"
        }
    }
    """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User4.self, from: data) {
                print(user.name)
                print(user.address.street)
            }
        }
    }
}


#Preview {
    CodableDataExample()
}

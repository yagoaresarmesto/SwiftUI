import SwiftUI
import Observation

struct User {
    var firstName = "Yago"
    var lastName = "Ares"
}

@Observable //Para que actualize el estado, hay que usar Observable, mira la propiedades dentro de la vista, y la actualiza cuando cambia
class User2 {
    var firstName = "Jesús"
    var lastName = "Ares"
}

struct StateExample: View {
 
    @State private var user = User()
    @State private var user2 = User2()
    
    var body: some View {
        VStack{
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First Name", text: $user.firstName)
            TextField("LastName", text: $user.lastName)
        }
        .padding()
        
        //Como puedes ver si corres el código, cambiar el valor de una clase no se actualiza
        VStack{
            Text("Your name is \(user2.firstName) \(user2.lastName)")
            
            TextField("First Name", text: $user2.firstName)
            TextField("LastName", text: $user2.lastName)
        }
        .padding()
    }
}

#Preview {
    StateExample()
}

import SwiftUI

struct ListExamples: View {
    
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List {
            Section("Section 1"){
                Text("Static row 1")
                Text("Static row 2")
            }
            Section("Section 2"){
                ForEach(0..<4){
                    Text("Dynamic list \($0)")
                }
            }
            
            Section("Section 3"){
                Text("Static row 3")
                Text("Static row 4")
            }
        }
      //  .listStyle(.grouped)
        
        //Also you can create like this
        List(0..<5) {
            Text("Dynamic row \($0)")
        }
        
        //With an array declared before
        List(people, id: \.self) {
            Text($0)
        }

    }
}

#Preview {
    ListExamples()
}

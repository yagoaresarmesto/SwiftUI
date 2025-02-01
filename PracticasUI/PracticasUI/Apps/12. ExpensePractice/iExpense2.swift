//Propósito: Interiorizar conceptos y hacer app simple, con User defaulds, obvserbable sin ayuda

import SwiftUI

struct Item: Identifiable {
    let id = UUID() // let id: UUID -->    let id = UUID() para que lo genere automaticamente
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Inventory {
    var items = [Item]()
}

struct iExpense2: View {
    @State private var inventory = Inventory()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Inventory")
            .toolbar{
                Button("Add item", systemImage: "plus"){
                    let item = Item(name: "Test", type: "Personal", amount: 5)
                    inventory.items.append(item)
                }
            }
        }
    }
    func removeItems(at offsets: IndexSet){
        inventory.items.remove(atOffsets: offsets)
    }
}

#Preview {
    iExpense2()
}

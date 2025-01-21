import SwiftUI

struct ExpenseItem: Identifiable { //Así ya no necesitamos indicar al foreach que prodpiedad user como id
    let id = UUID() //Que genere un id de forma automática
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}


struct iExpense: View {
    @State var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        
        NavigationStack {
            List{
                ForEach(expenses.items){ item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense", systemImage: "plus"){
                    //let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                   // expenses.items.append(expense)
                    
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    iExpense()
}

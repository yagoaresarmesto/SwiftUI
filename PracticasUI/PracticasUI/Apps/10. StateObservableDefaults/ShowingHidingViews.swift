import SwiftUI


struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Hello, \(name)")
        
        Button ("Dismiss"){
            dismiss()
        }
    }
}

struct ShowingHidingViews: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show sheet"){
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet){
            SecondView(name: "Yago")
        }
    }
}

#Preview {
    ShowingHidingViews()
}

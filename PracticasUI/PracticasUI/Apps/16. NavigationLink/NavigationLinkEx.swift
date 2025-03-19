import SwiftUI

struct DetailView:View {
    var number: Int

    var body: some View {
        Text("DetailView \(number)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

//El punto es que observemos que se crean muchas instancias, lo cual esto no es óptimo ya que hace trabajar mucho más de lo necesario
struct NavigationLinkEx: View {
    var body: some View {
        NavigationStack{
            List(0..<1000) { i in
                NavigationLink("Tap Me") {
                    DetailView(number: 556)
                }
            }
        }
    }
}

#Preview {
    NavigationLinkEx()
}

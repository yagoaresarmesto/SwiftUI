import SwiftUI

struct NavigationLinkExample: View {
    var body: some View {
        NavigationStack{
            NavigationLink {
                Text("Detail View")
            } label: {
                VStack {
                    Text("This is a label")
                    Text("This is a image")
                    Image(systemName: "face.smiling")
                }
                .font(.largeTitle)
            }
                .navigationTitle("SwiftUI")
        }

    }
}

#Preview {
    NavigationLinkExample()
}

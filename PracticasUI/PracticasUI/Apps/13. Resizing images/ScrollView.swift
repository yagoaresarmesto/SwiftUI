import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating custom text")
        self.text = text
    }
}

struct ScrollViewExample: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) { //Este tipo de vstack hace que varge el contenido que se ve en panatalla, no todo el contenido del scroll
          //  VStack(spacing: 10){
                ForEach(0..<100){
                    CustomText(text: "Item \($0)")
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    ScrollViewExample()
}

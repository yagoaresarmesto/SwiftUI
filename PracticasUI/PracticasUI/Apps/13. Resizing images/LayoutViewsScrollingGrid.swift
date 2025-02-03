import SwiftUI

struct LayoutViewsScrollingGrid: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    var body: some View {
        ScrollView {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000){
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    LayoutViewsScrollingGrid()
}

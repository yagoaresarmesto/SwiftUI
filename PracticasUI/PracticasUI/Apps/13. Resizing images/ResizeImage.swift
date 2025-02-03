import SwiftUI

struct ResizeImage: View {
    var body: some View {
        Image(.example)
            .resizable()
          //  .scaledToFill()
           .scaledToFit()
          //  .frame(width: 300, height: 300)
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
            
    }
}

#Preview {
    ResizeImage()
}

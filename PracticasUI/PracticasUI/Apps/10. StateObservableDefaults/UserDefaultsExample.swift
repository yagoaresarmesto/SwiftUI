import SwiftUI

struct UserDefaultsExample: View {
    
    @AppStorage("tapcount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)"){
            tapCount += 1
        }
    }
}

#Preview {
    UserDefaultsExample()
}

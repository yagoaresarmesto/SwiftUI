import SwiftUI

struct ViewAstronauts: View {
    let astronauts = Bundle.main.decode("astronauts2.json")
    
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    ViewAstronauts()
}

import SwiftUI

struct LoadResources: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    func testBundels(){
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt"){
            if let fileContents = try? String(contentsOf: fileURL){
                //We loaded the file into a string
                //And do what you want with that string
            }
        }
    }
}


#Preview {
    LoadResources()
}

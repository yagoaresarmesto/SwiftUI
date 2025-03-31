import SwiftUI

struct RemotaImageServer: View {
    var body: some View {

        /* Esto no funcionaría
         AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
         .resizable()
         .frame(width: 200, height: 200)
         */

        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            //Color.red
            ProgressView() // un loader
        }
        .frame(width: 200, height: 200)

        //Si quermos un control total de la imagen podemos usar esto
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)

    }

}

#Preview {
    RemotaImageServer()
}

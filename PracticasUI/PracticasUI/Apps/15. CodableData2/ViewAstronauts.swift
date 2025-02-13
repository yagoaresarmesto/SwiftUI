import SwiftUI

struct ViewAstronauts: View {
    let astronauts: [String: AstronautX] = Bundle.main.decodeX("astronauts2.json")
    let missions: [MissionX] = Bundle.main.decodeX("missions2.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(missions){ mission in
                        NavigationLink {
                            Text("Detalles")
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                            
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Misiones")
            .background(.darkBG)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ViewAstronauts()
}

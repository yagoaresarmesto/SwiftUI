import SwiftUI

struct ViewMission: View {
    
    struct CrewMember {
        let role: String
        let astronaut: AstronautX
    }
    let mission: MissionX
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    Text("Detalles de la misión")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink {
                                Text("Detalles del astronauta")
                            } label: {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .overlay(
                                            Capsule()
                                                .stroke(.white, lineWidth: 1)
                                        )
                                    
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        
                                        Text(crewMember.role)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBG)
    }
    
    init(mission: MissionX, astronauts: [String: AstronautX]){
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
                
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}


#Preview {
    let missions : [MissionX] = Bundle.main.decode("missions2.json")
    let astronauts: [String: AstronautX] = Bundle.main.decode("astronauts2.json")
    
    return ViewMission(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}


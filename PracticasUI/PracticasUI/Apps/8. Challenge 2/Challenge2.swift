import SwiftUI

struct Challenge2: View {
    
    @State private var win = true
    @State private var defaultMove = "Piedra"
    @State private var score = 0
    @State private var numberOfQuestions = 0
    
    let playerMove = ["Piedra", "Papel", "Tijera"]
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Section("Selecciona tu jugada") {
                    Picker("Movimiento del jugador", selection: $defaultMove) {
                        ForEach(playerMove, id: \.self) { move in
                            Text(move)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Button("Empezar ronda") {
                        startGame()
                    }
                }
                Spacer()
            }
            
            .padding()
            .navigationTitle("Desafío 2")
            // .onAppear()
        }
    }
    
    func addScore(){
        score += 1
    }
    
    func addQuestion(){
        numberOfQuestions += 1
    }
    
    
    func startGame(){
        var playerOption = defaultMove
        var machineOption = ["Piedra","Papel", "Tijera"].randomElement() ?? "Piedra"
        
        print("Jugador seleccionó: \(playerOption)")
        print("La máquina seleccionó: \(machineOption)")
        
        switch (playerOption, machineOption) {
        case ("Piedra", "Piedra"), ("Papel", "Papel"), ("Tijera", "Tijera"):
            print("Empate")
            addQuestion()
        case ("Piedra", "Tijera"), ("Papel", "Piedra"), ("Tijera", "Papel"):
            print("Has ganado la ronda")
            addQuestion()
            addScore()
        default:
            print("Has perdido esta ronda")
            addQuestion()
        }
    }
}

#Preview {
    Challenge2()
}


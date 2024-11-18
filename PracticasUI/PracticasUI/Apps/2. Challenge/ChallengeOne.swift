import SwiftUI

struct ChallengeOne: View {
    @State private var amount: Double = 0
    @State var inputUnit = "Fahrenheit"
    @State var outputUnit = "Fahrenheit"
    
    let units = ["Fahrenheit", "Celsius", "Kelvin"]
    
    var conversion: Double {
        var resultado: Double = 0
        let cantidad = amount
        let input: String = inputUnit
        let output: String = outputUnit
        
        switch (input, output) {
        case ("Fahrenheit", "Celsius"):
            resultado = (cantidad - 32) * 5 / 9
            
        case ("Fahrenheit", "Kelvin"):
            resultado = (amount - 32) * 5 / 9 + 273.15
            
        case ("Celsius", "Fahrenheit"):
            resultado = (amount * 9 / 5) + 32
            
        case ("Celsius", "Kelvin"):
            resultado = amount + 273.15
            
        case ("Kelvin", "Fahrenheit"):
            resultado = (amount - 273.15) * 9 / 5 + 32
            
        case ("Kelvin", "Celsius"):
            resultado = amount - 273.15
        default:
            resultado = cantidad
        }
        
        return resultado
    }
    
    var body: some View {
        Form {
            Section ("Temperatura inicial:"){
                Picker("Input", selection: $inputUnit){
                    ForEach(units, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                //Test
                .onChange(of: inputUnit) { newValue in
                    print("Nueva unidad de entrada seleccionada: \(newValue)")
                }
            }
            
            Section ("Temperatura a pasar:"){
                Picker("Input", selection: $outputUnit){
                    ForEach(units, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
              
            }
            Section("Introduce la cantidad"){
                TextField("Amount", value: $amount, format: .number)
                    .keyboardType(.decimalPad)
            }
            
            Section("Resultado") {
                TextField("Resultado", value: .constant(conversion), format: .number)
                    .disabled(true)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    ChallengeOne()
}

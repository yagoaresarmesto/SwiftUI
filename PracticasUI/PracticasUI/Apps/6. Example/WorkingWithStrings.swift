import SwiftUI

struct WorkingWithStrings: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func testStrings(){
        
        //Swift nos proporciona un método llamado components(separatedBy:) que puede converir una cadena en un array
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        
        //Si en una cadena las palabras están separadas por saltos de línea:
        
        let input2 = """
                     a
                     b
                     c
                     """
        
        let letters2 = input2.components(separatedBy: "\n")
        
        //El resultado sera siempre una matriz de cadenas, podemos leer valores individuales en la matriz, como letters[0],[1]...
        
        //Devuleve un elemento aleatorio del array
        let letter = letters.randomElement()
        
        //Elimina todos los espacios en blanco al princicpio y al final de una cadena
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Para comprobar si una cadena tiene palabras mal escritas
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
    }
}



#Preview {
    WorkingWithStrings()
}

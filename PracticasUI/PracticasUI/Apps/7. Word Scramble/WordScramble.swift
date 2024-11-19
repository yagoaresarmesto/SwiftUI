import SwiftUI

struct WordScramble: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never) //No poner mayus en el input al empezar
                }
                
                Section {
                    ForEach(usedWords, id: \.self){ word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
        }
    }
    
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        //El string lo pone en minus y omite los espacions en blanco y saltos de línea
        //"   HeLLo WoRLd   \n" -> hello word
        
        guard answer.count > 0 else { return }
        
        //Extra validation to come
        
        withAnimation{
            usedWords.insert(answer, at: 0) //añadimos la respuesta al array de strings
        }

        newWord = "" // Seteamos la palabra otr vez vacía
    }
}

#Preview {
    WordScramble()
}

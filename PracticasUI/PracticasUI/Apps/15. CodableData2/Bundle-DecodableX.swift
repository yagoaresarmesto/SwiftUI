import Foundation

//Aquí convertiremos el .json de astronatuas en un array de Astronautas, usaremos un Bundle para encontrar la ruta del archivo, cargarlo en una isntacia de Data y lo pasaremos a través de un JSONDecoder. Vamos a usar genéricos para que pueda leer ambos json

extension Bundle { //Extiende la funcionalidad de Bundle con un método personalizado
    func decodeX<T: Codable>(_ file: String) -> T { //Define una funcion que recibe el nombre del archivo y devuleve un diccionario de Astronautas
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Error al localizar \(file) en el bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Error al cargar \(file) del bundle.")
        }
        
        let decoder = JSONDecoder()
        
        //Aquí es el decodificador de fecha, para cmabiar el formato de fecha
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        //Esta parte del método ahora me dirá que salió mal con la decodificación
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Error al decodificar \(file) del bundle porque falta clave '\(key.stringValue)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Error al decodificar  \(file) del bundle porque el tipo no coincide – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Error al decodificar  \(file) del bundle porque falta \(type) valor – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Error al decodificar  \(file) del bundle porque es un JSON inválido.")
        } catch {
            fatalError("Error al decodificar  \(file) del bundle: \(error.localizedDescription)")
        }
        
    }
}

/*
 guard condición else {
 
 //Código que se ejecuta si la condición es falsa
 
 return // o break, throw, fatalError, etc.
 }
 */

//Al final guard es como una barrera para validar requisitos al inicio de una función

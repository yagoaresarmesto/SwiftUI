import Foundation

//Usaomos este Dundle para encontrar la ruta del archivo, cargarlo en una isntancia de Data y pasarlo a través de un JSON decoder

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) form bundle.")
        }
        
        let decoder = JSONDecoder()
        
        //Método para que mirar que salió mal en la decodificación, con diferentes posibles errores
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context){
            fatalError(
                "Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context){
            fatalError(
                "Failed to decode \(file) from bundle due to type mismatch - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}

//
//  APIClient.swift
//  Architecture_MVC
//
//  Created by Álvaro Gascón on 21/3/24.
//

import Foundation


final class ListOfCharactersAPIClient {
    func getListOfCharacters() async -> CharacterModelResponse{ // Retorna nuestro modelo
        let url = URL(string:"https://rickandmortyapi.com/api/character")! // Creamos URL donde vamos a hacer la petición HTTP
        let (data, _) = try! await URLSession.shared.data(from: url) // Hacemos la petición HTTP
        return try! JSONDecoder().decode(CharacterModelResponse.self, from: data) // Devolvemos el resultado parseado con nuestro modelo
    }
}

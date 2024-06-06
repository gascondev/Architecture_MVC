//
//  CharacterModelResponse.swift
//  Architecture_MVC
//
//  Created by Álvaro Gascón on 21/3/24.
//

import Foundation

struct CharacterModelResponse: Decodable {
    let results: [CharacterModel] // Array de nuestro modelo CharacterModel
}

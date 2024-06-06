//
//  CharacterModel.swift
//  Architecture_MVC
//
//  Created by Álvaro Gascón on 21/3/24.
//

import Foundation

// Este es el modelo
struct CharacterModel: Decodable {
    let name: String
    let status: String
    let species: String
    let image: String
}

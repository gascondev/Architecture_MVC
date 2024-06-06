//
//  CharactersListView.swift
//  Architecture_MVC
//
//  Created by Álvaro Gascón on 21/3/24.
//

import Foundation
import UIKit

// Crear propiedad de la vista
class CharactersListView: UIView {
    let charactersTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CharacterListCellView.self, forCellReuseIdentifier: "CharacterListCellView")
        return tableView
    }()
    
    // Crear inicializadores
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Crear método
    func setupView() {
        addSubview(charactersTableView) // Añade la TableView a la vista
        
        NSLayoutConstraint.activate([ // Aplica constrains
            charactersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            charactersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            charactersTableView.topAnchor.constraint(equalTo: topAnchor),
            charactersTableView.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
    }
}

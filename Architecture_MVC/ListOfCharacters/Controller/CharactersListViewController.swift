//
//  ViewController.swift
//  Architecture_MVC
//
//  Created by Álvaro Gascón on 21/3/24.
//

import UIKit

class CharactersListViewController: UIViewController {
    var mainView: CharactersListView { self.view as! CharactersListView }
    var apiClient = ListOfCharactersAPIClient()
    private var tableViewDataSource: ListOfCharactersTableViewDataSource?
    private var tableViewDelegate: ListOfCharactersTableViewDelegate?
    
    override func loadView() {
        view = CharactersListView()
        tableViewDelegate = ListOfCharactersTableViewDelegate()
        
        tableViewDataSource = ListOfCharactersTableViewDataSource(tableView: mainView.charactersTableView)
        mainView.charactersTableView.dataSource = tableViewDataSource
        mainView.charactersTableView.delegate = tableViewDelegate

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            print("Index \(index)")
            
            // Present New View Controller
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            
            let characterModel = dataSource.characters[index]
            let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
            self?.present(characterDetailViewController, animated: true)
        }
        
        Task {
            let characters = await apiClient.getListOfCharacters()
            print("Characters \(characters)")
            tableViewDataSource?.set(characters: characters.results)
        }
    }
}


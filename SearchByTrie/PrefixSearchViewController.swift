//
//  PrefixSearchViewController.swift
//  SearchByTrie
//
//  Created by Vadim Chistiakov on 18.03.2024.
//

import UIKit

final class PrefixSearchViewController: UIViewController,
                                        UITableViewDataSource,
                                        UITableViewDelegate,
                                        UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private let trie = Trie()
    private let wordListModel = WordListModel()
    private var filteredWords: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Настройка UISearchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Words"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = filteredWords[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filteredWords = wordListModel.predictNextWords(searchText)
            tableView.reloadData()
        }
    }
}





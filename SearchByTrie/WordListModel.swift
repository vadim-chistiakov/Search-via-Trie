//
//  WordListModel.swift
//  SearchByTrie
//
//  Created by Vadim Chistiakov on 18.03.2024.
//

import Foundation

final class WordListModel {

    private let words = ["apple", "app", "application",
                         "banana", "bar", "bank",
                         "orange", "ornament", "orca", "oxigen",
                         "grape", "granade", "grand", "garden",
                         "pineapple", "pistol"] // Пример списка слов
    private let trie = Trie()
    
    init() {
        self.insertWordList()
    }
    
    func predictNextWords(_ searchText: String) -> [String] {
        trie.predictNextWords(from: searchText.lowercased())
    }
    
    // Заполнение префиксного дерева словами
    private func insertWordList() {
        for word in words {
            trie.insert(word)
        }
    }
    
    
}

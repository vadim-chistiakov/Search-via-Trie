//
//  TrieNode.swift
//  SearchByTrie
//
//  Created by Vadim Chistiakov on 18.03.2024.
//

import Foundation

class TrieNode {
    var children: [Character: TrieNode]
    var isEndOfWord: Bool
    
    init() {
        self.children = [:]
        self.isEndOfWord = false
    }
}

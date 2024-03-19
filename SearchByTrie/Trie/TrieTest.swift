//
//  TrieTest.swift
//  SearchByTrie
//
//  Created by Vadim Chistiakov on 18.03.2024.
//

import Foundation

func trieTest() {
    let trie = Trie()
    let words = ["apple", "banana", "app", "bat", "cat"]
    for word in words {
        trie.insert(word)
    }

    // Predict next word based on characters entered
    let predictions = trie.predictNextWords(from: "app") // ["app", "apple"]
    print(predictions)
}

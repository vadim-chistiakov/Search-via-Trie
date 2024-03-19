//
//  TrieDataStructure.swift
//  SearchByTrie
//
//  Created by Vadim Chistiakov on 18.03.2024.
//

import Foundation

protocol TrieProtocol {
    var root: TrieNode { get }
    
    // Вставить слово в префиксное дерево
    func insert(_ word: String)
    
    // Предположить вводимые слова
    func predictNextWords(from prefix: String) -> [String]
}

final class Trie: TrieProtocol {
    
    var root = TrieNode()
    
    // Вставить слово в префиксное дерево
    func insert(_ word: String) {
        var current = root
        for char in word {
            if current.children[char] == nil {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
        }
        current.isEndOfWord = true
    }
    
    // Предположить вводимые слова
    func predictNextWords(from prefix: String) -> [String] {
        var current = root
        for char in prefix {
            if let nextNode = current.children[char] {
                current = nextNode
            } else {
                return []
            }
        }
        return wordsStartingWith(prefix: prefix, node: current)
    }
    
    // Хелпер, помогает найти список слов по заданному префиксу
    private func wordsStartingWith(prefix: String, node: TrieNode) -> [String] {
        var results: [String] = []
        
        if node.isEndOfWord {
            results.append(prefix)
        }
        
        for (char, childNode) in node.children {
            let newPrefix = prefix + String(char)
            results += wordsStartingWith(prefix: newPrefix, node: childNode)
        }
        
        return results
    }
}

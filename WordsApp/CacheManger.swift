//
//  CacheManger.swift
//  WordsApp
//
//  Created by asmaa gamal  on 21/12/2023.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()
    private let cache = NSCache<NSString, NSString>()
    private let maxCacheSize = 10
    private var queue: [String] = []

    private init() {}

    func cacheWord(_ word: String) {
        // Remove the oldest entry if the queue reached its max size
        if queue.count == maxCacheSize {
            let oldestWord = queue.removeFirst()
            cache.removeObject(forKey: NSString(string: oldestWord))
        }

        // Add the new word
        queue.append(word)
        cache.setObject(NSString(string: word), forKey: NSString(string: word))
        print("\(word) added to Cache")
    }

    func getCachedWords() -> [String] {
        var words = [String]()
        for word in queue {
            if let cachedWord = cache.object(forKey: NSString(string: word)) as String? {
                words.append(cachedWord)
            }
        }
        return words
    }
}

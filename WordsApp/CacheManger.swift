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

    private init() {}

    func cacheWord(_ word: String) {
        if let currentCount = cache.object(forKey: "count") as? String,
           var count = Int(currentCount), count < 10 {
            
            count += 1
            cache.setObject(NSString(string: "\(count)"), forKey: "count")
            cache.setObject(NSString(string: word), forKey: NSString(string: "\(count)"))
            print("\(word) added to Cache")
            
        } else {
            resetCache()
            cache.setObject("1", forKey: "count")
            
            cache.setObject(NSString(string: word), forKey: "1")
        }
    }

    func getCachedWords() -> [String] {
        var words = [String]()
        if let currentCount = cache.object(forKey: "count") as? String,
           let count = Int(currentCount) {
            for i in 1...count {
                if let word = cache.object(forKey: NSString(string: "\(i)")) as String? {
                    words.append(word)
                }
            }
        }
        
        return words
    }

    private func resetCache() {
        cache.removeAllObjects()
    }
}

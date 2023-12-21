//
//  SearchViewModel.swift
//  WordsApp
//
//  Created by asmaa gamal  on 21/12/2023.
//

import Foundation
class SearchViewModel: ObservableObject {
    @Published var data: WordModel?
    @Published var isSearching = false
    @Published var cachedWords: [String] = []

    static let shared = SearchViewModel()

    private init() {}

    func addWordToCache(_ word: String) {
        CacheManager.shared.cacheWord(word)
        self.cachedWords = CacheManager.shared.getCachedWords()
    }

    func fetchData(query: String, category: SearchCategory) {
        NetworkManger.shared.fetch(query: query) { [weak self] word in
            DispatchQueue.main.async {
                if let result = word {
                    self?.data = result
                    self?.isSearching = true
                }
            }
        }
        addWordToCache(query)
    }
}

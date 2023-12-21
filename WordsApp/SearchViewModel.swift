//
//  SearchViewModel.swift
//  WordsApp
//
//  Created by asmaa gamal  on 21/12/2023.
//

import Foundation
class SearchViewModel: ObservableObject {
    @Published var cachedWords: [String] = []
static let shared = SearchViewModel()
    private init(){}
    func addWordToCache(_ word: String) {
        
        CacheManager.shared.cacheWord(word)
        
        self.cachedWords = CacheManager.shared.getCachedWords()
        
    }
}

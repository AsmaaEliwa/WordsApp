//
//  searchResultView.swift
//  WordsApp
//
//  Created by asmaa gamal  on 20/12/2023.
//

import SwiftUI

struct searchResultView: View {
    @Binding var word: WordModel?
    
    var body: some View {
        WordView(word: $word)
    }
}

//#Preview {
//    searchResultView()
//}
